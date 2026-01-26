# main.py - Enhanced Discord Bot for Order & Chat Automation

import asyncio
from datetime import datetime
import discord
from discord.ext import commands
import aiohttp

import config
import utils
import browser
import scraper
import ui

# =============================================================================
# BOT SETUP
# =============================================================================

intents = discord.Intents.default()
intents.message_content = True
bot = commands.Bot(command_prefix=".", intents=intents)

# Lock to prevent concurrent browser operations
browser_command_lock = asyncio.Lock()
# Track if an order is being monitored (browser is busy)
order_monitoring_active = False


# =============================================================================
# BACKGROUND TASKS
# =============================================================================

async def send_webhook_notification(embed_data: dict):
    """Send notification via webhook (separate rate limit pool!)."""
    webhook_url = config.WEBHOOK_URL_NEW_SALE
    if not webhook_url:
        return False
    
    try:
        async with aiohttp.ClientSession() as session:
            webhook_payload = {
                "embeds": [embed_data],
                "username": "Eldorado Alerts",
                "avatar_url": "https://www.eldorado.gg/favicon.ico"
            }
            async with session.post(webhook_url, json=webhook_payload) as resp:
                if resp.status in (200, 204):
                    return True
                else:
                    utils.consoleprint(f"Webhook failed: {resp.status}")
                    return False
    except Exception as e:
        utils.consoleprint(f"Webhook error: {e}")
        return False


async def monitor_new_conversations():
    """Background task to detect new customer conversations."""
    await bot.wait_until_ready()
    
    # Check notification method
    use_webhook = bool(config.WEBHOOK_URL_NEW_SALE)
    channel = bot.get_channel(config.CHANNEL_ID_NEW_SALE) if not use_webhook else None
    
    if use_webhook:
        utils.consoleprint(f"✅ New customer notifications via WEBHOOK (separate rate limit!)")
    elif channel:
        utils.consoleprint(f"✅ New customer notifications to channel: {channel.name}")
    else:
        utils.consoleprint(f"⚠️ WARNING: No notification method configured!")
    
    while not bot.is_closed():
        try:
            loop = asyncio.get_event_loop()
            top_chat = await loop.run_in_executor(
                browser.playwright_executor, 
                scraper.check_new_top_conversation
            )
            
            if top_chat and (use_webhook or channel):
                # Extract username (remove the -XXXX suffix for display)
                full_name = top_chat['name']
                username = full_name.split('-')[0] if '-' in full_name else full_name
                
                # Format the message preview
                message_preview = top_chat['message']
                # Clean up system messages
                if "Order Created" in message_preview:
                    message_preview = "🆕 New Order Created!"
                elif "Order Delivered" in message_preview:
                    message_preview = "📦 Order Delivered notification"
                else:
                    message_preview = utils.truncate_text(message_preview, 150)
                
                # Build embed data
                embed_data = {
                    "title": "🔔 New Customer Message!",
                    "description": f"**{full_name}** has sent you a message!",
                    "color": 0x2ECC71,  # GREEN
                    "fields": [
                        {"name": "⏰ Time", "value": top_chat['time'] or "Just now", "inline": True},
                        {"name": "👤 Customer", "value": full_name, "inline": True},
                        {"name": "💬 Message", "value": message_preview, "inline": False}
                    ],
                    "footer": {"text": f"Use .order {username} to manage this order"},
                    "timestamp": datetime.utcnow().isoformat()
                }
                
                if use_webhook:
                    # Send via webhook (no rate limit issues!)
                    success = await send_webhook_notification(embed_data)
                    if success:
                        utils.consoleprint(f"📨 Webhook notification sent for: {full_name}")
                else:
                    # Fallback to bot message
                    embed = discord.Embed(
                        title=embed_data["title"],
                        description=embed_data["description"],
                        color=embed_data["color"],
                        timestamp=datetime.utcnow()
                    )
                    for field in embed_data["fields"]:
                        embed.add_field(name=field["name"], value=field["value"], inline=field["inline"])
                    embed.set_footer(text=embed_data["footer"]["text"])
                    
                    view = ui.NewCustomerView(username)
                    await channel.send(embed=embed, view=view)
                    utils.consoleprint(f"📨 Notification sent for: {full_name}")
                
        except Exception as e:
            utils.consoleprint(f"Monitor error: {e}")
        
        await asyncio.sleep(5)


# =============================================================================
# EMBED BUILDERS
# =============================================================================

def create_order_embed(info: dict, username: str, url: str, view: ui.OrderMonitorView = None) -> discord.Embed:
    """
    Create a beautifully formatted order embed with ANSI colored chat.
    
    Args:
        info: Order data dictionary
        username: Customer username
        url: Order URL
        view: Optional view for paginated chat
        
    Returns:
        Discord Embed object
    """
    status = info.get("status", "Unknown")
    color = utils.get_status_color(status)
    status_emoji = utils.get_status_emoji(status)
    
    # Get chat lines
    chat_lines = []
    if view and view.chat_lines:
        chat_lines = view.chat_lines
    elif info.get("chat_html"):
        parsed = utils.parse_html_to_text(info["chat_html"])
        chat_lines = parsed.get("clean", [])
    
    # Format chat with ANSI colors (grouped style)
    if chat_lines:
        # Get page of chat if paginated
        if view:
            page_data = utils.paginate_chat(chat_lines, view.chat_page, view.per_page)
            page_lines = page_data["lines"]
            page_info = f"Page {page_data['page'] + 1}/{page_data['total_pages']}"
        else:
            page_lines = chat_lines[-12:]
            page_info = ""
        
        chat_text = utils.format_chat_ansi_grouped(page_lines, 15)
        if page_info:
            chat_text += f"\n\n{utils.ANSI['gray']}📄 {page_info}{utils.ANSI['reset']}"
    else:
        chat_text = "No chat history found."
    
    # Build embed
    embed = discord.Embed(
        title=f"{status_emoji} Order: {status}",
        url=url,
        color=color,
        timestamp=datetime.utcnow()
    )
    
    # Item name at the top with BLUE color (if available)
    item_name = info.get('itemName', 'N/A')
    if item_name and item_name != 'N/A':
        # Use ANSI blue coloring in code block
        blue_item = f"```ansi\n{utils.ANSI['bold_blue']}{item_name}{utils.ANSI['reset']}\n```"
        embed.add_field(name="🏷️ Item", value=blue_item, inline=False)
    
    # Status bar with visual indicator
    status_bar = create_status_bar(status)
    embed.add_field(name="📊 Status", value=f"{status_bar}\n**{status}**", inline=False)
    
    # Order details in a clean grid
    embed.add_field(name="🎮 Game", value=info.get('game', 'N/A'), inline=True)
    embed.add_field(name="📦 Quantity", value=info.get('quantity', 'N/A'), inline=True)
    embed.add_field(name="👤 Buyer", value=info.get('buyer', 'N/A'), inline=True)
    
    embed.add_field(name="💰 You Earn", value=info.get('earnings', 'N/A'), inline=True)
    embed.add_field(name="⏳ Delivery Time", value=info.get('deliveryTime', 'N/A'), inline=True)
    embed.add_field(name="\u200b", value="\u200b", inline=True)  # Spacer
    
    # Chat history with ANSI colors
    # Limit to 1000 chars to stay within Discord limits
    if len(chat_text) > 900:
        chat_text = chat_text[:900] + f"\n{utils.ANSI['gray']}... truncated{utils.ANSI['reset']}"
    
    embed.add_field(name="💬 Chat History", value=f"```ansi\n{chat_text}\n```", inline=False)
    
    from datetime import datetime as dt
    embed.set_footer(text=f"Monitoring {username} • Last update: {dt.now().strftime('%H:%M:%S')}")
    
    return embed


def create_status_bar(status: str) -> str:
    """Create a visual progress bar for order status."""
    status = status.lower()
    
    stages = ["pending", "paid", "delivering", "delivered", "completed"]
    current = 0
    
    if "pending" in status:
        current = 1
    elif "paid" in status:
        current = 2
    elif "delivering" in status:
        current = 3
    elif "delivered" in status:
        current = 4
    elif "completed" in status:
        current = 5
    elif "cancelled" in status or "canceled" in status:
        return "❌━━━━━━━━━━ Cancelled"
    elif "disputed" in status:
        return "⚠️━━━━━━━━━━ Disputed"
    
    filled = "🟢" * current
    empty = "⚪" * (5 - current)
    
    return f"{filled}{empty}"


# =============================================================================
# BOT EVENTS
# =============================================================================

@bot.event
async def on_ready():
    """Called when bot is ready."""
    utils.consoleprint(f"Bot Ready! Logged in as {bot.user}")
    utils.consoleprint(f"Prefix: {bot.command_prefix}")
    bot.loop.create_task(monitor_new_conversations())


# =============================================================================
# COMMANDS
# =============================================================================

@bot.command(name="list")
async def list_chats(ctx):
    """List recent conversations with pagination."""
    if order_monitoring_active:
        await ctx.send("⏳ An order is being monitored. Close it first with the Close button.")
        return
    
    if browser_command_lock.locked():
        await ctx.send("⏳ Another command is using the browser. Please wait...")
        return
    
    async with browser_command_lock:
        status_msg = await ctx.send("📬 Loading conversations...")
        
        loop = asyncio.get_event_loop()
        data = await loop.run_in_executor(browser.playwright_executor, scraper.scrape_chats_list)

        if "error" in data:
            await status_msg.edit(content=f"❌ Error: {data['error']}")
            return

        chats = data.get("chats", [])
        if not chats:
            await status_msg.edit(content="📭 No conversations found.")
            return

        # Create paginated view
        view = ui.ConversationListView(ctx, chats)
        await status_msg.edit(content=None, embed=view.get_embed(), view=view)


@bot.command(name="chat")
async def get_chat(ctx, username: str = None):
    """
    Fetch and display chat history with a user.
    
    Usage: .chat <username>
    """
    if not username:
        embed = discord.Embed(
            title="💬 Chat Command",
            description="Fetch chat history with a customer.",
            color=0x3498db
        )
        embed.add_field(name="Usage", value="`.chat <username>`", inline=False)
        embed.add_field(name="Example", value="`.chat JohnDoe123`", inline=False)
        await ctx.send(embed=embed)
        return
    
    if order_monitoring_active:
        await ctx.send("⏳ An order is being monitored. Close it first with the Close button.")
        return
    
    if browser_command_lock.locked():
        await ctx.send("⏳ Another command is using the browser. Please wait...")
        return
    
    async with browser_command_lock:
        status_msg = await ctx.send(f"💬 Fetching chat with **{username}**...")
        
        loop = asyncio.get_event_loop()
        data = await loop.run_in_executor(
            browser.playwright_executor, 
            scraper.scrape_specific_conversation, 
            username
        )
        
        if "error" in data:
            await status_msg.edit(content=f"❌ Error: {data['error']}")
            return
        
        clean_lines = data.get("clean", [])
        
        if not clean_lines:
            await status_msg.edit(content=f"📭 No messages found with **{username}**.")
            return
        
        # Create paginated chat view
        view = ui.ChatView(ctx, username, clean_lines)
        view.update_buttons()
        
        await status_msg.edit(content=None, embed=view.get_embed(), view=view)


@bot.command(name="order")
async def get_order(ctx, username: str = None):
    """
    Open order page and start monitoring with interactive controls.
    
    Usage: .order <username>
    """
    global order_monitoring_active
    
    if not username:
        embed = discord.Embed(
            title="📦 Order Command",
            description="Monitor and manage a customer's order.",
            color=0x3498db
        )
        embed.add_field(name="Usage", value="`.order <username>`", inline=False)
        embed.add_field(name="Example", value="`.order JohnDoe123`", inline=False)
        embed.add_field(
            name="Features", 
            value="• Quick reply buttons\n• Message templates\n• Order actions (Deliver/Cancel)\n• Live chat updates\n• Paginated history",
            inline=False
        )
        await ctx.send(embed=embed)
        return

    if order_monitoring_active:
        await ctx.send("⏳ An order is already being monitored. Close it first with the Close button.")
        return
    
    if browser_command_lock.locked():
        await ctx.send("⏳ Another command is using the browser. Please wait...")
        return

    async with browser_command_lock:
        order_monitoring_active = True
        status_msg = await ctx.send(f"🔍 Searching for order link for **{username}**...")
        loop = asyncio.get_event_loop()

        # Navigate to order page
        nav_result = await loop.run_in_executor(
            browser.playwright_executor, 
            scraper.navigate_to_order_page, 
            username
        )
    
    if "error" in nav_result:
        order_monitoring_active = False  # Reset on error
        await status_msg.edit(content=f"❌ Error: {nav_result['error']}")
        return
    
    order_url = nav_result["url"]
    await status_msg.edit(content=f"📦 Found order! Loading details...")

    # Scrape initial data
    scrape_result = await loop.run_in_executor(
        browser.playwright_executor, 
        scraper.scrape_current_order_page
    )
    
    if "error" in scrape_result:
        order_monitoring_active = False  # Reset on error
        await status_msg.edit(content=f"❌ Scrape Error: {scrape_result['error']}")
        return
    
    info = scrape_result["data"]
    
    # Parse initial chat lines
    chat_lines = []
    if info.get("chat_html"):
        parsed = utils.parse_html_to_text(info["chat_html"])
        chat_lines = parsed.get("clean", [])
    
    # Create view and embed
    view = ui.OrderMonitorView(ctx, username, chat_lines)
    embed = create_order_embed(info, username, order_url, view)
    
    msg = await ctx.send(embed=embed, view=view)
    await status_msg.delete()

    # Monitor Loop
    update_count = 0
    while view.monitoring:
        await asyncio.sleep(8)  # Slightly faster updates
        if not view.monitoring:
            break
        
        try:
            new_result = await loop.run_in_executor(
                browser.playwright_executor, 
                scraper.scrape_current_order_page
            )
            
            if new_result.get("success"):
                new_info = new_result["data"]
                update_count += 1
                
                # Update chat lines
                if new_info.get("chat_html"):
                    parsed = utils.parse_html_to_text(new_info["chat_html"])
                    new_lines = parsed.get("clean", [])
                    
                    # Check if chat has new messages
                    old_count = len(view.chat_lines)
                    view.update_chat_lines(new_lines)
                    
                    if len(new_lines) > old_count:
                        utils.consoleprint(f"New messages detected! ({old_count} -> {len(new_lines)})")
                
                new_embed = create_order_embed(new_info, username, order_url, view)
                new_embed.set_footer(text=f"Monitoring {username} • Update #{update_count} • Every 8s")
                
                try:
                    await msg.edit(embed=new_embed, view=view)
                except discord.NotFound:
                    utils.consoleprint("Message was deleted, stopping monitor.")
                    break
                except discord.HTTPException as e:
                    utils.consoleprint(f"Failed to update message: {e}")
            else:
                utils.consoleprint(f"Monitor Loop Error: {new_result.get('error')}")
        except Exception as e:
            utils.consoleprint(f"Monitor exception: {e}")

    # Cleanup - close order page
    await loop.run_in_executor(browser.playwright_executor, scraper.close_order_page_logic)
    
    # CRITICAL: Reset the monitoring flag so .order can be used again
    order_monitoring_active = False
    utils.consoleprint(f"Order monitoring stopped for {username}")
    
    # Update embed to show stopped state
    try:
        final_embed = msg.embeds[0]
        final_embed.set_footer(text="🛑 Monitoring Stopped • Page Closed")
        final_embed.color = 0x99AAB5
        await msg.edit(embed=final_embed, view=None)
    except:
        pass


@bot.command(name="active")
async def active_orders(ctx):
    """
    Show active orders that need to be delivered.
    
    Usage: .active
    """
    # Check if order is being monitored - can't navigate away
    if order_monitoring_active:
        await ctx.send("⏳ An order is being monitored. Close it first with the Close button before using `.active`.")
        return
    
    # Check if browser is busy with another command
    if browser_command_lock.locked():
        await ctx.send("⏳ Another command is using the browser. Please wait...")
        return
    
    status_msg = await ctx.send("📦 Fetching active orders...")
    
    loop = asyncio.get_event_loop()
    
    async with browser_command_lock:
        result = await loop.run_in_executor(
            browser.playwright_executor,
            scraper.scrape_active_orders
        )
    
    if "error" in result:
        await status_msg.edit(content=f"❌ Error: {result['error']}")
        return
    
    orders = result.get("orders", [])
    
    if not orders:
        embed = discord.Embed(
            title="📦 Active Orders",
            description="✅ No pending orders! All caught up.",
            color=0x2ECC71
        )
        await status_msg.edit(content=None, embed=embed)
        return
    
    # Build embed
    embed = discord.Embed(
        title=f"📦 Active Orders ({len(orders)})",
        description="Orders waiting to be delivered:",
        color=0xFFA500,
        timestamp=datetime.utcnow()
    )
    
    for i, order in enumerate(orders[:10], 1):
        customer = order.get('customerName', 'Unknown')
        item = order.get('itemName', 'Unknown Item')
        earnings = order.get('earnings', 'N/A')
        time_left = order.get('timeLeft', 'N/A')
        status = order.get('status', 'Pending')
        
        # Format field
        field_value = f"🏷️ {item}\n💰 {earnings} • ⏳ {time_left}\n📊 {status}"
        
        embed.add_field(
            name=f"{i}. {customer}",
            value=field_value,
            inline=False
        )
    
    embed.set_footer(text="Click a button to get the order command")
    
    # Create view with buttons
    view = ui.ActiveOrdersView(ctx, orders)
    
    await status_msg.edit(content=None, embed=embed, view=view)


@bot.command(name="send")
async def quick_send(ctx, username: str = None, *, message: str = None):
    """
    Send a quick message to a user without opening order page.
    
    Usage: .send <username> <message>
    """
    if not username or not message:
        embed = discord.Embed(
            title="✉️ Quick Send Command",
            description="Send a message to a customer quickly.",
            color=0x3498db
        )
        embed.add_field(name="Usage", value="`.send <username> <message>`", inline=False)
        embed.add_field(name="Example", value="`.send JohnDoe123 Hello! What is your username?`", inline=False)
        await ctx.send(embed=embed)
        return
    
    if order_monitoring_active:
        await ctx.send("⏳ An order is being monitored. Use the Quick Reply buttons instead, or close the order first.")
        return
    
    if browser_command_lock.locked():
        await ctx.send("⏳ Another command is using the browser. Please wait...")
        return
    
    status_msg = await ctx.send(f"✉️ Sending message to **{username}**...")
    
    loop = asyncio.get_event_loop()
    
    # First, open their chat
    chat_result = await loop.run_in_executor(
        browser.playwright_executor,
        scraper.scrape_specific_conversation,
        username
    )
    
    if "error" in chat_result:
        await status_msg.edit(content=f"❌ Error: {chat_result['error']}")
        return
    
    # Now send the message
    send_result = await loop.run_in_executor(
        browser.playwright_executor,
        scraper.send_message_logic,
        message
    )
    
    if send_result.get("success"):
        embed = discord.Embed(
            title="✅ Message Sent",
            color=0x2ecc71
        )
        embed.add_field(name="To", value=username, inline=True)
        embed.add_field(name="Message", value=utils.truncate_text(message, 200), inline=False)
        await status_msg.edit(content=None, embed=embed)
    else:
        await status_msg.edit(content=f"❌ Failed to send: {send_result.get('error')}")


@bot.command(name="templates")
async def show_templates(ctx):
    """Show all available quick reply templates."""
    embed = discord.Embed(
        title="📋 Quick Reply Templates",
        description="These templates are available when using `.order` command.",
        color=0x9b59b6
    )
    
    # Quick replies
    quick_section = ""
    for key, value in config.QUICK_REPLIES.items():
        short_val = utils.truncate_text(value, 50)
        quick_section += f"**{key}**: {short_val}\n"
    
    embed.add_field(name="⚡ Quick Replies", value=quick_section, inline=False)
    
    # Message templates
    template_section = ""
    for key in config.MESSAGE_TEMPLATES.keys():
        template_section += f"• {key}\n"
    
    embed.add_field(name="📄 Long Templates", value=template_section, inline=False)
    
    embed.set_footer(text="Edit config.py to customize these templates")
    
    await ctx.send(embed=embed)


@bot.command(name="commands")
async def commands_help(ctx):
    """Show help for all commands."""
    embed = discord.Embed(
        title="📚 Bot Commands",
        description="Order & Chat Automation for Eldorado.gg\nUse `.commands` to see this again.",
        color=0x3498db
    )
    
    commands_list = [
        ("`.list`", "Show recent conversations with pagination"),
        ("`.chat <user>`", "View chat history with a customer"),
        ("`.order <user>`", "Open order page with full controls"),
        ("`.active`", "Show pending orders that need delivery"),
        ("`.send <user> <msg>`", "Quick send a message"),
        ("`.templates`", "Show available message templates"),
    ]
    
    for cmd, desc in commands_list:
        embed.add_field(name=cmd, value=desc, inline=False)
    
    embed.add_field(
        name="📦 Order Controls",
        value=(
            "**Quick Replies**: Select from dropdown\n"
            "**Templates**: Longer pre-written messages\n"
            "**Custom Message**: Type your own\n"
            "**Delivered**: Mark order complete\n"
            "**Cancel**: Cancel the order\n"
            "**Pagination**: Browse chat history"
        ),
        inline=False
    )
    
    await ctx.send(embed=embed)


# =============================================================================
# MAIN ENTRY POINT
# =============================================================================

if __name__ == "__main__":
    if config.DISCORD_TOKEN:
        utils.consoleprint("Starting bot...")
        bot.run(config.DISCORD_TOKEN)
    else:
        utils.consoleprint("❌ Missing DISCORD_TOKEN in config!")
        utils.consoleprint("Set DISCORD_TOKEN environment variable or edit config.py")
