# config.py - Configuration for Discord Bot

import os

# Discord Bot Token
DISCORD_TOKEN = os.getenv("DISCORD_TOKEN", "")

# Channel ID for new sale notifications
CHANNEL_ID_NEW_SALE = int(os.getenv("CHANNEL_ID_NEW_SALE", "0"))

# Path to browser state file (for saved login session)
STATE_PATH = os.getenv("STATE_PATH", "state.json")

# Quick Reply Templates - Customize these for your needs
QUICK_REPLIES = {
    "greeting": "Hello! Thank you for your order. How can I help you today?",
    "username": "What is your in-game username so I can deliver your order?",
    "confirm": "Your order has been received and I'll begin processing it shortly.",
    "wait": "Please give me a few minutes to prepare your delivery.",
    "delivering": "I'm delivering your order now. Please be online and ready to receive.",
    "done": "Delivery complete! Please confirm you've received everything.",
    "review": "Thank you for your purchase! If you're satisfied, please leave a review. ⭐",
    "issue": "I'm sorry to hear there's an issue. Can you please describe what happened?",
    "offline": "It seems you're offline. Please come online so I can complete the delivery.",
    "payment": "I can see your payment has been received. Thank you!",
}

# Message Templates (longer, more detailed messages)
MESSAGE_TEMPLATES = {
    "welcome": """Hello and welcome! 👋

Thank you for choosing our service. I've received your order and will begin processing it right away.

Please provide your in-game username so I can deliver your items.""",
    
    "delivery_instructions": """📦 **Delivery Instructions**

1. Please make sure you're online in the game
2. Go to the designated meeting spot
3. Accept the trade request when I send it
4. Verify all items before confirming

Let me know when you're ready!""",
    
    "completion": """✅ **Order Complete!**

Your order has been successfully delivered. Thank you for your purchase!

If you have any questions or concerns, please don't hesitate to reach out.

We'd appreciate if you could leave a positive review! ⭐""",
    
    "delay": """⏳ **Slight Delay Notice**

I apologize, but there will be a small delay with your order. I'm working on it and will have it ready for you as soon as possible.

Thank you for your patience!""",
}
