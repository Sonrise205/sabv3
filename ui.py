# ui.py - Enhanced Discord UI Components

import discord
from discord.ui import View, Button, Select, Modal, TextInput
import asyncio
import browser
import scraper
import config
import utils


# =============================================================================
# MESSAGE MODAL - Custom Message Input
# =============================================================================

class MessageModal(Modal, title="Send Message to Customer"):
    """Modal for sending custom messages."""
    
    message_input = TextInput(
        label="Message content",
        style=discord.TextStyle.paragraph,
        placeholder="Type your message here...",
        required=True,
        max_length=500
    )

    async def on_submit(self, interaction: discord.Interaction):
        await interaction.response.defer(ephemeral=True)
        msg_content = self.message_input.value
        
        loop = asyncio.get_event_loop()
        result = await loop.run_in_executor(
            browser.playwright_executor, 
            scraper.send_message_logic, 
            msg_content
        )
        
        if result.get("success"):
            await interaction.followup.send(f"✅ **Sent:** {msg_content}", ephemeral=True)
        else:
            await interaction.followup.send(f"❌ **Failed:** {result.get('error')}", ephemeral=True)


# =============================================================================
# QUICK REPLY SELECT - Dropdown for Quick Responses
# =============================================================================

class QuickReplySelect(Select):
    """Dropdown menu for quick reply messages."""
    
    def __init__(self):
        options = [
            discord.SelectOption(
                label="👋 Greeting",
                value="greeting",
                description="Thank the customer for their order",
                emoji="👋"
            ),
            discord.SelectOption(
                label="❓ Ask Username",
                value="username",
                description="Request in-game username",
                emoji="🎮"
            ),
            discord.SelectOption(
                label="📦 Confirm Order",
                value="confirm",
                description="Confirm order received",
                emoji="📦"
            ),
            discord.SelectOption(
                label="⏳ Please Wait",
                value="wait",
                description="Ask for patience",
                emoji="⏳"
            ),
            discord.SelectOption(
                label="🚚 Delivering Now",
                value="delivering",
                description="Notify about delivery",
                emoji="🚚"
            ),
            discord.SelectOption(
                label="✅ Delivery Complete",
                value="done",
                description="Confirm delivery is done",
                emoji="✅"
            ),
            discord.SelectOption(
                label="⭐ Request Review",
                value="review",
                description="Ask for a review",
                emoji="⭐"
            ),
            discord.SelectOption(
                label="🔧 Issue Response",
                value="issue",
                description="Respond to a problem",
                emoji="🔧"
            ),
            discord.SelectOption(
                label="📴 User Offline",
                value="offline",
                description="Ask user to come online",
                emoji="📴"
            ),
            discord.SelectOption(
                label="💳 Payment Received",
                value="payment",
                description="Confirm payment",
                emoji="💳"
            ),
        ]
        super().__init__(
            placeholder="⚡ Quick Reply - Select a message...",
            options=options,
            row=0
        )
    
    async def callback(self, interaction: discord.Interaction):
        # Get the message template
        selected_key = self.values[0]
        message = config.QUICK_REPLIES.get(selected_key, "")
        
        if not message:
            await interaction.response.send_message("❌ Template not found.", ephemeral=True)
            return
        
        await interaction.response.defer(ephemeral=True)
        
        loop = asyncio.get_event_loop()
        result = await loop.run_in_executor(
            browser.playwright_executor,
            scraper.send_message_logic,
            message
        )
        
        if result.get("success"):
            # Show which message was sent
            short_msg = utils.truncate_text(message, 100)
            await interaction.followup.send(f"✅ **Sent:** {short_msg}", ephemeral=True)
        else:
            await interaction.followup.send(f"❌ **Failed:** {result.get('error')}", ephemeral=True)
        
        # Reset the select
        self.placeholder = "⚡ Quick Reply - Select a message..."


# =============================================================================
# MESSAGE TEMPLATE SELECT - Longer Templates
# =============================================================================

class MessageTemplateSelect(Select):
    """Dropdown for longer message templates."""
    
    def __init__(self):
        options = [
            discord.SelectOption(
                label="📝 Welcome Message",
                value="welcome",
                description="Full welcome and intro",
                emoji="📝"
            ),
            discord.SelectOption(
                label="📋 Delivery Instructions",
                value="delivery_instructions",
                description="Step-by-step delivery guide",
                emoji="📋"
            ),
            discord.SelectOption(
                label="🎉 Order Complete",
                value="completion",
                description="Thank you and review request",
                emoji="🎉"
            ),
            discord.SelectOption(
                label="⏰ Delay Notice",
                value="delay",
                description="Apologize for delay",
                emoji="⏰"
            ),
        ]
        super().__init__(
            placeholder="📄 Templates - Select a longer message...",
            options=options,
            row=1
        )
    
    async def callback(self, interaction: discord.Interaction):
        selected_key = self.values[0]
        message = config.MESSAGE_TEMPLATES.get(selected_key, "")
        
        if not message:
            await interaction.response.send_message("❌ Template not found.", ephemeral=True)
            return
        
        await interaction.response.defer(ephemeral=True)
        
        loop = asyncio.get_event_loop()
        result = await loop.run_in_executor(
            browser.playwright_executor,
            scraper.send_message_logic,
            message
        )
        
        if result.get("success"):
            await interaction.followup.send(f"✅ **Sent template:** {selected_key}", ephemeral=True)
        else:
            await interaction.followup.send(f"❌ **Failed:** {result.get('error')}", ephemeral=True)


# =============================================================================
# ENHANCED ORDER MONITOR VIEW - Main View with All Controls
# =============================================================================

class OrderMonitorView(View):
    """Enhanced view for order monitoring with quick replies and actions."""
    
    def __init__(self, ctx, username, chat_lines=None):
        super().__init__(timeout=None)
        self.ctx = ctx
        self.username = username
        self.monitoring = True
        self.chat_lines = chat_lines or []
        self.chat_page = 0
        self.per_page = 10
        
        # Add the select menus
        self.add_item(QuickReplySelect())
        self.add_item(MessageTemplateSelect())

    # -------------------------------------------------------------------------
    # ROW 2: Quick Preset Buttons (Most Common Actions)
    # -------------------------------------------------------------------------
    
    @discord.ui.button(label="Greet", style=discord.ButtonStyle.secondary, emoji="👋", row=2)
    async def greet_btn(self, interaction: discord.Interaction, button: Button):
        """Send greeting message."""
        if interaction.user != self.ctx.author:
            await interaction.response.send_message("Only the command sender can use this.", ephemeral=True)
            return
        await self._send_quick_message(interaction, "greeting")

    @discord.ui.button(label="Username?", style=discord.ButtonStyle.secondary, emoji="🎮", row=2)
    async def username_btn(self, interaction: discord.Interaction, button: Button):
        """Ask for username."""
        if interaction.user != self.ctx.author:
            await interaction.response.send_message("Only the command sender can use this.", ephemeral=True)
            return
        await self._send_quick_message(interaction, "username")

    @discord.ui.button(label="Confirm", style=discord.ButtonStyle.success, emoji="📦", row=2)
    async def confirm_btn(self, interaction: discord.Interaction, button: Button):
        """Confirm order received."""
        if interaction.user != self.ctx.author:
            await interaction.response.send_message("Only the command sender can use this.", ephemeral=True)
            return
        await self._send_quick_message(interaction, "confirm")

    @discord.ui.button(label="Delivering", style=discord.ButtonStyle.success, emoji="🚚", row=2)
    async def delivering_btn(self, interaction: discord.Interaction, button: Button):
        """Notify delivering now."""
        if interaction.user != self.ctx.author:
            await interaction.response.send_message("Only the command sender can use this.", ephemeral=True)
            return
        await self._send_quick_message(interaction, "delivering")

    @discord.ui.button(label="Done", style=discord.ButtonStyle.success, emoji="✅", row=2)
    async def done_btn(self, interaction: discord.Interaction, button: Button):
        """Confirm delivery complete."""
        if interaction.user != self.ctx.author:
            await interaction.response.send_message("Only the command sender can use this.", ephemeral=True)
            return
        await self._send_quick_message(interaction, "done")

    # -------------------------------------------------------------------------
    # ROW 3: Chat Actions
    # -------------------------------------------------------------------------
    
    @discord.ui.button(label="Custom", style=discord.ButtonStyle.primary, emoji="✉️", row=3)
    async def send_message_btn(self, interaction: discord.Interaction, button: Button):
        """Open modal for custom message."""
        if interaction.user != self.ctx.author:
            await interaction.response.send_message("Only the command sender can use this.", ephemeral=True)
            return
        await interaction.response.send_modal(MessageModal())

    @discord.ui.button(label="Refresh", style=discord.ButtonStyle.secondary, emoji="🔄", row=3)
    async def refresh_btn(self, interaction: discord.Interaction, button: Button):
        """Manually refresh the order data."""
        if interaction.user != self.ctx.author:
            await interaction.response.send_message("Only the command sender can use this.", ephemeral=True)
            return
        
        await interaction.response.defer(ephemeral=True)
        await interaction.followup.send("🔄 Refreshing...", ephemeral=True)
        # The main loop will handle the refresh

    @discord.ui.button(label="Close", style=discord.ButtonStyle.danger, emoji="🛑", row=3)
    async def close_order(self, interaction: discord.Interaction, button: Button):
        """Stop monitoring and close the order page."""
        if interaction.user != self.ctx.author:
            await interaction.response.send_message("Only the command sender can close this.", ephemeral=True)
            return

        self.monitoring = False
        
        # Disable all buttons
        for child in self.children:
            child.disabled = True
            
        await interaction.response.edit_message(view=self)
    
    # -------------------------------------------------------------------------
    # Helper Method for Quick Messages
    # -------------------------------------------------------------------------
    
    async def _send_quick_message(self, interaction: discord.Interaction, key: str):
        """Helper to send a quick reply message."""
        message = config.QUICK_REPLIES.get(key, "")
        if not message:
            await interaction.response.send_message("❌ Template not found.", ephemeral=True)
            return
        
        await interaction.response.defer(ephemeral=True)
        
        loop = asyncio.get_event_loop()
        result = await loop.run_in_executor(
            browser.playwright_executor,
            scraper.send_message_logic,
            message
        )
        
        if result.get("success"):
            short_msg = utils.truncate_text(message, 80)
            await interaction.followup.send(f"✅ **Sent:** {short_msg}", ephemeral=True)
        else:
            await interaction.followup.send(f"❌ **Failed:** {result.get('error')}", ephemeral=True)

    # -------------------------------------------------------------------------
    # ROW 4: Order Actions (Website buttons)
    # -------------------------------------------------------------------------
    
    @discord.ui.button(label="Mark Delivered", style=discord.ButtonStyle.success, emoji="📦", row=4)
    async def confirm_delivery(self, interaction: discord.Interaction, button: Button):
        """Mark order as delivered on the website."""
        if interaction.user != self.ctx.author:
            await interaction.response.send_message("Only the command sender can use this.", ephemeral=True)
            return
        
        await interaction.response.defer(ephemeral=True)
        
        loop = asyncio.get_event_loop()
        result = await loop.run_in_executor(
            browser.playwright_executor, 
            scraper.action_mark_delivered
        )
        
        if result.get("success"):
            await interaction.followup.send("✅ **Order Marked as Delivered on Website!**", ephemeral=True)
        else:
            await interaction.followup.send(f"❌ Failed: {result.get('error')}", ephemeral=True)

    @discord.ui.button(label="Cancel Order", style=discord.ButtonStyle.danger, emoji="⚠️", row=4)
    async def cancel_order(self, interaction: discord.Interaction, button: Button):
        """Cancel the order on the website."""
        if interaction.user != self.ctx.author:
            await interaction.response.send_message("Only the command sender can use this.", ephemeral=True)
            return
        
        await interaction.response.defer(ephemeral=True)
        
        loop = asyncio.get_event_loop()
        result = await loop.run_in_executor(
            browser.playwright_executor, 
            scraper.action_cancel_order
        )
        
        if result.get("success"):
            await interaction.followup.send("⚠️ **Order Cancelled on Website!**", ephemeral=True)
        else:
            await interaction.followup.send(f"❌ Failed: {result.get('error')}", ephemeral=True)

    @discord.ui.button(label="◀️", style=discord.ButtonStyle.secondary, row=4)
    async def prev_page(self, interaction: discord.Interaction, button: Button):
        """Show older messages."""
        if interaction.user != self.ctx.author:
            await interaction.response.send_message("Only the command sender can use this.", ephemeral=True)
            return
        
        if self.chat_page > 0:
            self.chat_page -= 1
        
        await interaction.response.defer()

    @discord.ui.button(label="▶️", style=discord.ButtonStyle.secondary, row=4)
    async def next_page(self, interaction: discord.Interaction, button: Button):
        """Show newer messages."""
        if interaction.user != self.ctx.author:
            await interaction.response.send_message("Only the command sender can use this.", ephemeral=True)
            return
        
        total_pages = (len(self.chat_lines) + self.per_page - 1) // self.per_page
        if self.chat_page < total_pages - 1:
            self.chat_page += 1
        
        await interaction.response.defer()

    def update_chat_lines(self, lines: list):
        """Update the stored chat lines."""
        self.chat_lines = lines or []

    def get_paginated_chat(self) -> str:
        """Get the current page of chat as formatted text."""
        if not self.chat_lines:
            return "No chat history found."
        
        paginated = utils.paginate_chat(self.chat_lines, self.chat_page, self.per_page)
        
        formatted_lines = []
        for line in paginated["lines"]:
            if line.startswith("[SYSTEM]:"):
                formatted_lines.append(f"🔴 {line}")
            elif "Me:" in line:
                formatted_lines.append(f"🔵 {line}")
            elif "Them:" in line:
                formatted_lines.append(f"⚪ {line}")
            else:
                formatted_lines.append(line)
        
        # Add page indicator
        page_info = f"\n\n📄 Page {paginated['page'] + 1}/{paginated['total_pages']}"
        
        return "\n".join(formatted_lines) + page_info


# =============================================================================
# SIMPLE CHAT VIEW - For .chat command
# =============================================================================

class ChatView(View):
    """Simple view for browsing chat history."""
    
    def __init__(self, ctx, username, chat_lines):
        super().__init__(timeout=300)  # 5 minute timeout
        self.ctx = ctx
        self.username = username
        self.chat_lines = chat_lines or []
        self.page = 0
        self.per_page = 15
    
    def get_embed(self) -> discord.Embed:
        """Generate embed for current page."""
        paginated = utils.paginate_chat(self.chat_lines, self.page, self.per_page)
        
        formatted_lines = []
        for line in paginated["lines"]:
            if line.startswith("[SYSTEM]:"):
                formatted_lines.append(f"🔴 {line}")
            elif "Me:" in line:
                formatted_lines.append(f"🔵 {line}")
            elif "Them:" in line:
                formatted_lines.append(f"⚪ {line}")
            else:
                formatted_lines.append(line)
        
        description = "\n".join(formatted_lines) if formatted_lines else "No messages found."
        
        embed = discord.Embed(
            title=f"💬 Chat with {self.username}",
            description=description,
            color=0x2b2d31
        )
        
        if paginated["total_pages"] > 1:
            embed.set_footer(text=f"Page {paginated['page'] + 1}/{paginated['total_pages']} • {len(self.chat_lines)} messages")
        else:
            embed.set_footer(text=f"{len(self.chat_lines)} messages")
        
        return embed
    
    def update_buttons(self):
        """Update button states based on pagination."""
        paginated = utils.paginate_chat(self.chat_lines, self.page, self.per_page)
        
        for child in self.children:
            if hasattr(child, 'custom_id'):
                if child.custom_id == "prev":
                    child.disabled = not paginated["has_prev"]
                elif child.custom_id == "next":
                    child.disabled = not paginated["has_next"]
    
    @discord.ui.button(label="◀️ Older", style=discord.ButtonStyle.secondary, custom_id="prev")
    async def prev_btn(self, interaction: discord.Interaction, button: Button):
        if interaction.user != self.ctx.author:
            await interaction.response.send_message("Only the command sender can use this.", ephemeral=True)
            return
        
        if self.page > 0:
            self.page -= 1
        
        self.update_buttons()
        await interaction.response.edit_message(embed=self.get_embed(), view=self)
    
    @discord.ui.button(label="Newer ▶️", style=discord.ButtonStyle.secondary, custom_id="next")
    async def next_btn(self, interaction: discord.Interaction, button: Button):
        if interaction.user != self.ctx.author:
            await interaction.response.send_message("Only the command sender can use this.", ephemeral=True)
            return
        
        total_pages = (len(self.chat_lines) + self.per_page - 1) // self.per_page
        if self.page < total_pages - 1:
            self.page += 1
        
        self.update_buttons()
        await interaction.response.edit_message(embed=self.get_embed(), view=self)
    
    @discord.ui.button(label="Reply", style=discord.ButtonStyle.primary, emoji="✉️")
    async def reply_btn(self, interaction: discord.Interaction, button: Button):
        if interaction.user != self.ctx.author:
            await interaction.response.send_message("Only the command sender can use this.", ephemeral=True)
            return
        await interaction.response.send_modal(MessageModal())


# =============================================================================
# CONVERSATION LIST VIEW - For .list command
# =============================================================================

class ConversationListView(View):
    """View for browsing the conversation list."""
    
    def __init__(self, ctx, chats):
        super().__init__(timeout=300)
        self.ctx = ctx
        self.chats = chats or []
        self.page = 0
        self.per_page = 5
    
    def get_embed(self) -> discord.Embed:
        """Generate embed for current page."""
        total_pages = max(1, (len(self.chats) + self.per_page - 1) // self.per_page)
        start = self.page * self.per_page
        end = start + self.per_page
        page_chats = self.chats[start:end]
        
        embed = discord.Embed(
            title="📬 Recent Conversations",
            color=0x58B9FF
        )
        
        if not page_chats:
            embed.description = "No conversations found."
        else:
            for i, chat in enumerate(page_chats, start=start + 1):
                name = chat.get('name', 'Unknown')
                item = chat.get('item', 'No Item')
                time = chat.get('time', '')
                message = utils.truncate_text(chat.get('message', 'No message'), 80)
                
                # Create field
                header = f"{i}. **{name}** • {item}"
                if time:
                    header += f" • `{time}`"
                
                embed.add_field(name=header, value=message, inline=False)
        
        embed.set_footer(text=f"Page {self.page + 1}/{total_pages} • {len(self.chats)} conversations")
        
        return embed
    
    @discord.ui.button(label="◀️", style=discord.ButtonStyle.secondary)
    async def prev_btn(self, interaction: discord.Interaction, button: Button):
        if interaction.user != self.ctx.author:
            await interaction.response.send_message("Only the command sender can use this.", ephemeral=True)
            return
        
        if self.page > 0:
            self.page -= 1
        
        await interaction.response.edit_message(embed=self.get_embed(), view=self)
    
    @discord.ui.button(label="▶️", style=discord.ButtonStyle.secondary)
    async def next_btn(self, interaction: discord.Interaction, button: Button):
        if interaction.user != self.ctx.author:
            await interaction.response.send_message("Only the command sender can use this.", ephemeral=True)
            return
        
        total_pages = max(1, (len(self.chats) + self.per_page - 1) // self.per_page)
        if self.page < total_pages - 1:
            self.page += 1
        
        await interaction.response.edit_message(embed=self.get_embed(), view=self)
    
    @discord.ui.button(label="Refresh", style=discord.ButtonStyle.primary, emoji="🔄")
    async def refresh_btn(self, interaction: discord.Interaction, button: Button):
        if interaction.user != self.ctx.author:
            await interaction.response.send_message("Only the command sender can use this.", ephemeral=True)
            return
        
        await interaction.response.defer()
        
        loop = asyncio.get_event_loop()
        data = await loop.run_in_executor(browser.playwright_executor, scraper.scrape_chats_list)
        
        if "error" not in data:
            self.chats = data.get("chats", [])
            self.page = 0
        
        await interaction.edit_original_response(embed=self.get_embed(), view=self)
