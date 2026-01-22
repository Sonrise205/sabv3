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
