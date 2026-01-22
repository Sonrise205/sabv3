# utils.py - Utility functions for Discord Bot

from datetime import datetime
from bs4 import BeautifulSoup

# ANSI Colors (for console output)
ANSI_RESET = "\u001b[0m"
ANSI_RED = "\u001b[0;31m"
ANSI_BLUE = "\u001b[0;34m"
ANSI_WHITE = "\u001b[0;37m"
ANSI_PINK = "\u001b[0;35m"
ANSI_GREEN = "\u001b[0;32m"

def consoleprint(message: str):
    """Print a timestamped message to the console."""
    ts = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    print(f"[{ts}] {message}")

def format_timestamp(raw_date_str: str) -> str:
    """Convert raw timestamp to clean format."""
    if not raw_date_str:
        return ""
    try:
        dt = datetime.strptime(raw_date_str, "%a, %B %d, %Y at %I:%M:%S %p")
        return dt.strftime("%d/%m/%Y at %H:%M:%S")
    except ValueError:
        return raw_date_str

def format_relative_time(timestamp_str: str) -> str:
    """Convert timestamp to relative time (e.g., '2m ago')."""
    if not timestamp_str:
        return ""
    try:
        # Try parsing the formatted timestamp
        dt = datetime.strptime(timestamp_str, "%d/%m/%Y at %H:%M:%S")
        now = datetime.now()
        diff = now - dt
        
        seconds = diff.total_seconds()
        if seconds < 60:
            return "just now"
        elif seconds < 3600:
            mins = int(seconds // 60)
            return f"{mins}m ago"
        elif seconds < 86400:
            hours = int(seconds // 3600)
            return f"{hours}h ago"
        else:
            days = int(seconds // 86400)
            return f"{days}d ago"
    except ValueError:
        return timestamp_str

def parse_html_to_text(html_content: str) -> dict:
    """
    Parse HTML chat content to formatted text.
    Returns dict with 'ansi' (colored console) and 'clean' (plain text) versions.
    """
    soup = BeautifulSoup(html_content, 'html.parser')
    
    ansi_log = []
    clean_log = []

    message_divs = soup.find_all("div", class_="MessageDiv")
    if not message_divs:
        return {"ansi": ["No messages found."], "clean": ["No messages found."]}

    last_sender = None

    for div in message_divs:
        # Handle system messages
        if div.find(class_="SystemMessage__message"):
            text = div.get_text(" ", strip=True)
            ansi_log.append(f"{ANSI_RED}[SYSTEM]: {text}{ANSI_RESET}")
            clean_log.append(f"[SYSTEM]: {text}")
            continue

        # Handle user messages
        user_row = div.find(class_="UserMessage__message-row")
        if user_row:
            classes = user_row.get("class", [])
            sender = "UNKNOWN"
            color_code = ANSI_WHITE

            if "UserMessage__by-me" in classes:
                sender = "Me"
                color_code = ANSI_BLUE
            elif "UserMessage__by-other" in classes:
                sender = "Them"
                color_code = ANSI_WHITE
            elif "UserMessage__previous-same" in classes:
                sender = last_sender or ">>"
                if sender == "Me":
                    color_code = ANSI_BLUE
                elif sender == "Them":
                    color_code = ANSI_WHITE

            msg_span = div.find(class_="EntityTreeRenderer")
            msg_text = msg_span.get_text(" ", strip=True) if msg_span else "[Image/Content]"

            time_span = div.find("span", role="time")
            raw_time = time_span["title"] if time_span and time_span.has_attr("title") else ""
            clean_time = format_timestamp(raw_time)
            
            if clean_time:
                ansi_line = f"{ANSI_PINK}[{clean_time}]{ANSI_RESET} {color_code}{sender}: {msg_text}{ANSI_RESET}"
                clean_line = f"[{clean_time}] {sender}: {msg_text}"
            else:
                ansi_line = f"{color_code}{sender}: {msg_text}{ANSI_RESET}"
                clean_line = f"{sender}: {msg_text}"

            ansi_log.append(ansi_line)
            clean_log.append(clean_line)
            
            if sender != ">>":
                last_sender = sender

    return {"ansi": ansi_log, "clean": clean_log}

def format_chat_for_embed(lines: list, max_lines: int = 15) -> str:
    """
    Format chat lines for Discord embed with emoji indicators.
    
    Args:
        lines: List of chat lines
        max_lines: Maximum number of lines to include
        
    Returns:
        Formatted string for embed description
    """
    if not lines:
        return "No chat history found."
    
    # Take last N lines
    recent_lines = lines[-max_lines:]
    
    formatted_lines = []
    for line in recent_lines:
        if line.startswith("[SYSTEM]:"):
            # System messages in red
            formatted_lines.append(f"🔴 {line}")
        elif "Me:" in line:
            # Our messages in blue
            formatted_lines.append(f"🔵 {line}")
        elif "Them:" in line:
            # Their messages in white
            formatted_lines.append(f"⚪ {line}")
        else:
            formatted_lines.append(line)
    
    return "\n".join(formatted_lines)


# =============================================================================
# ANSI COLOR CODES FOR DISCORD
# =============================================================================

# ANSI escape codes for Discord ```ansi blocks
ANSI = {
    "reset": "\u001b[0m",
    "bold": "\u001b[1m",
    "underline": "\u001b[4m",
    # Foreground colors
    "gray": "\u001b[0;30m",
    "red": "\u001b[0;31m",
    "green": "\u001b[0;32m",
    "yellow": "\u001b[0;33m",
    "blue": "\u001b[0;34m",
    "pink": "\u001b[0;35m",
    "cyan": "\u001b[0;36m",
    "white": "\u001b[0;37m",
    # Bold foreground
    "bold_gray": "\u001b[1;30m",
    "bold_red": "\u001b[1;31m",
    "bold_green": "\u001b[1;32m",
    "bold_yellow": "\u001b[1;33m",
    "bold_blue": "\u001b[1;34m",
    "bold_pink": "\u001b[1;35m",
    "bold_cyan": "\u001b[1;36m",
    "bold_white": "\u001b[1;37m",
    # Backgrounds
    "bg_gray": "\u001b[40m",
    "bg_red": "\u001b[41m",
    "bg_green": "\u001b[42m",
    "bg_yellow": "\u001b[43m",
    "bg_blue": "\u001b[44m",
    "bg_pink": "\u001b[45m",
    "bg_cyan": "\u001b[46m",
    "bg_white": "\u001b[47m",
}


def format_chat_ansi(lines: list, max_lines: int = 12) -> str:
    """
    Format chat lines with ANSI color codes for Discord.
    
    Args:
        lines: List of chat lines (from parse_html_to_text)
        max_lines: Maximum lines to show
        
    Returns:
        ANSI formatted string ready for ```ansi code block
    """
    if not lines:
        return "No chat history found."
    
    recent_lines = lines[-max_lines:]
    formatted = []
    last_sender = None
    
    for line in recent_lines:
        # Parse the line to extract components
        formatted_line = _format_single_line_ansi(line, last_sender)
        formatted.append(formatted_line["text"])
        if formatted_line["sender"]:
            last_sender = formatted_line["sender"]
    
    return "\n".join(formatted)


def _format_single_line_ansi(line: str, last_sender: str = None) -> dict:
    """Format a single chat line with ANSI colors."""
    R = ANSI["reset"]
    
    # System message
    if line.startswith("[SYSTEM]:") or "[SYSTEM]" in line:
        # Clean up system message
        clean_msg = line.replace("[SYSTEM]:", "").replace("[SYSTEM]", "").strip()
        
        # Shorten common system messages
        if "Order Created" in clean_msg:
            clean_msg = "Order Created"
        elif "Order Delivered" in clean_msg:
            clean_msg = "Order Delivered"
        elif "received goods" in clean_msg.lower():
            clean_msg = "Order Delivered - Please confirm"
        
        # Truncate URLs
        if "http" in clean_msg:
            import re
            clean_msg = re.sub(r'https?://\S+', '[link]', clean_msg)
        
        text = f"{ANSI['bold_red']}━━ {clean_msg} ━━{R}"
        return {"text": text, "sender": None}
    
    # Parse timestamp and message
    import re
    
    # Pattern: [date at time] Sender: message
    # or just: Sender: message
    timestamp = ""
    sender = ""
    message = line
    
    # Try to extract timestamp
    time_match = re.search(r'\[([^\]]+)\]', line)
    if time_match:
        full_time = time_match.group(1)
        # Extract just HH:MM
        time_only = re.search(r'(\d{1,2}:\d{2})', full_time)
        if time_only:
            timestamp = time_only.group(1)
        # Remove timestamp from message
        message = line[time_match.end():].strip()
    
    # Extract sender
    if message.startswith("Me:"):
        sender = "Me"
        message = message[3:].strip()
    elif message.startswith("Them:"):
        sender = "Them"
        message = message[5:].strip()
    elif ": " in message:
        parts = message.split(": ", 1)
        if parts[0] in ["Me", "Them", ">>", last_sender or ""]:
            sender = parts[0]
            message = parts[1] if len(parts) > 1 else ""
    
    # Build formatted line
    if sender == "Me":
        time_part = f"{ANSI['gray']}{timestamp}{R} " if timestamp else ""
        text = f"{time_part}{ANSI['bold_blue']}Me:{R} {ANSI['blue']}{message}{R}"
    elif sender == "Them":
        time_part = f"{ANSI['gray']}{timestamp}{R} " if timestamp else ""
        text = f"{time_part}{ANSI['bold_white']}Them:{R} {ANSI['white']}{message}{R}"
    else:
        # Unknown format, just display as-is
        text = f"{ANSI['gray']}{line}{R}"
    
    return {"text": text, "sender": sender if sender in ["Me", "Them"] else last_sender}


def format_chat_ansi_grouped(lines: list, max_lines: int = 15) -> str:
    """
    Format chat with ANSI colors, grouping consecutive messages from same sender.
    
    Args:
        lines: List of chat lines
        max_lines: Maximum lines to show
        
    Returns:
        ANSI formatted string
    """
    if not lines:
        return "No chat history found."
    
    recent_lines = lines[-max_lines:]
    formatted = []
    last_sender = None
    last_time_minute = None
    
    R = ANSI["reset"]
    
    for line in recent_lines:
        import re
        
        # System message
        if "[SYSTEM]" in line:
            clean_msg = line.replace("[SYSTEM]:", "").replace("[SYSTEM]", "").strip()
            
            # Shorten
            if "Order Created" in clean_msg:
                formatted.append(f"\n{ANSI['bold_yellow']}━━━ 📋 Order Created ━━━{R}\n")
            elif "Order Delivered" in clean_msg or "received goods" in clean_msg.lower():
                formatted.append(f"\n{ANSI['bold_green']}━━━ ✅ Order Delivered ━━━{R}\n")
            else:
                # Truncate URLs and limit length
                clean_msg = re.sub(r'https?://\S+', '', clean_msg)
                clean_msg = clean_msg[:60] + "..." if len(clean_msg) > 60 else clean_msg
                formatted.append(f"{ANSI['red']}⚠ {clean_msg}{R}")
            
            last_sender = None
            continue
        
        # Parse timestamp
        timestamp = ""
        time_match = re.search(r'\[([^\]]+)\]', line)
        message = line
        if time_match:
            full_time = time_match.group(1)
            time_only = re.search(r'(\d{1,2}:\d{2})', full_time)
            if time_only:
                timestamp = time_only.group(1)
            message = line[time_match.end():].strip()
        
        # Parse sender
        sender = None
        if message.startswith("Me:"):
            sender = "Me"
            message = message[3:].strip()
        elif message.startswith("Them:"):
            sender = "Them"
            message = message[5:].strip()
        
        # Format based on sender
        if sender == "Me":
            if last_sender != "Me":
                # New sender block
                time_str = f" {ANSI['gray']}({timestamp}){R}" if timestamp else ""
                formatted.append(f"{ANSI['bold_blue']}▶ You{time_str}{R}")
            formatted.append(f"  {ANSI['blue']}{message}{R}")
        elif sender == "Them":
            if last_sender != "Them":
                # New sender block  
                time_str = f" {ANSI['gray']}({timestamp}){R}" if timestamp else ""
                formatted.append(f"{ANSI['bold_white']}◀ Customer{time_str}{R}")
            formatted.append(f"  {ANSI['white']}{message}{R}")
        else:
            formatted.append(f"{ANSI['gray']}{message}{R}")
        
        last_sender = sender
    
    return "\n".join(formatted)

def paginate_chat(lines: list, page: int = 0, per_page: int = 10) -> dict:
    """
    Paginate chat lines for navigation.
    
    Args:
        lines: All chat lines
        page: Current page number (0-indexed)
        per_page: Lines per page
        
    Returns:
        Dict with 'lines', 'page', 'total_pages', 'has_prev', 'has_next'
    """
    if not lines:
        return {
            "lines": [],
            "page": 0,
            "total_pages": 0,
            "has_prev": False,
            "has_next": False
        }
    
    total_pages = (len(lines) + per_page - 1) // per_page
    page = max(0, min(page, total_pages - 1))
    
    start_idx = page * per_page
    end_idx = start_idx + per_page
    page_lines = lines[start_idx:end_idx]
    
    return {
        "lines": page_lines,
        "page": page,
        "total_pages": total_pages,
        "has_prev": page > 0,
        "has_next": page < total_pages - 1
    }

def truncate_text(text: str, max_length: int = 100, suffix: str = "...") -> str:
    """Truncate text to max length with suffix."""
    if len(text) <= max_length:
        return text
    return text[:max_length - len(suffix)] + suffix

def get_status_color(status: str) -> int:
    """Get Discord embed color based on order status."""
    status = status.lower()
    
    if "pending" in status or "paid" in status:
        return 0xFFA500  # Orange
    elif "delivered" in status or "completed" in status:
        return 0x2ECC71  # Green
    elif "cancelled" in status or "canceled" in status or "disputed" in status:
        return 0xE74C3C  # Red
    elif "closed" in status:
        return 0x95A5A6  # Grey
    else:
        return 0x3498DB  # Blue (default)

def get_status_emoji(status: str) -> str:
    """Get emoji based on order status."""
    status = status.lower()
    
    if "pending" in status:
        return "⏳"
    elif "paid" in status:
        return "💳"
    elif "delivered" in status:
        return "📦"
    elif "completed" in status:
        return "✅"
    elif "cancelled" in status or "canceled" in status:
        return "❌"
    elif "disputed" in status:
        return "⚠️"
    elif "closed" in status:
        return "🔒"
    else:
        return "📋"
