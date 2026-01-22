# main.py - Enhanced Discord Bot for Order & Chat Automation

import asyncio
from datetime import datetime
import discord
from discord.ext import commands

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


# =============================================================================
# BACKGROUND TASKS
# =============================================================================

async def monitor_new_conversations():
    """Background task to detect new customer conversations."""
    await bot.wait_until_ready()
    channel = bot.get_channel(config.CHANNEL_ID_NEW_SALE)
    
    while not bot.is_closed():
        try:
            loop = asyncio.get_event_loop()
            top_chat = await loop.run_in_executor(
                browser.playwright_executor, 
                scraper.check_new_top_conversation
            )
            
            if top_chat and channel:
                embed = discord.Embed(
                    title="🔔 New Customer Detected",
                    description=f"**{top_chat['name']}** has messaged you!",
                    color=0x2ecc71,
                    timestamp=datetime.utcnow()
                )
                embed.add_field(name="⏰ Time", value=top_chat['time'] or "Just now", inline=True)
                embed.add_field(name="💬 Message", value=utils.truncate_text(top_chat['message'], 200), inline=False)
                embed.set_footer(text="Use .order <username> to manage this order")
                
                await channel.send(embed=embed)
                
        except Exception as e:
            utils.consoleprint(f"Monitor error: {e}")
        
        await asyncio.sleep(5)


# =============================================================================
# EMBED BUILDERS
# =============================================================================

def create_order_embed(info: dict, username: str, url: str, view: ui.OrderMonitorView = None) -> discord.Embed:
    """
    Create a beautifully formatted order embed.
    
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
    
    # Get chat text
    if view and view.chat_lines:
        chat_text = view.get_paginated_chat()
    else:
        chat_text = "No chat history found."
        if info.get("chat_html"):
            parsed = utils.parse_html_to_text(info["chat_html"])
            lines = parsed.get("clean", [])[-15:]
            chat_text = utils.format_chat_for_embed(lines, 15)
    
    # Build embed
    embed = discord.Embed(
        title=f"{status_emoji} Order: {status}",
        url=url,
        color=color,
        timestamp=datetime.utcnow()
    )
    
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
    
    # Chat history section
    if len(chat_text) > 1024:
        chat_text = chat_text[:1021] + "..."
    embed.add_field(name="💬 Chat History", value=f"```\n{chat_text}\n```", inline=False)
    
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

    status_msg = await ctx.send(f"🔍 Searching for order link for **{username}**...")
    loop = asyncio.get_event_loop()

    # Navigate to order page
    nav_result = await loop.run_in_executor(
        browser.playwright_executor, 
        scraper.navigate_to_order_page, 
        username
    )
    
    if "error" in nav_result:
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
    
    # Update embed to show stopped state
    try:
        final_embed = msg.embeds[0]
        final_embed.set_footer(text="🛑 Monitoring Stopped • Page Closed")
        final_embed.color = 0x99AAB5
        await msg.edit(embed=final_embed, view=None)
    except:
        pass


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
