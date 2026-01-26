# browser.py - Playwright Browser Management

import os
import threading
from concurrent.futures import ThreadPoolExecutor
from playwright.sync_api import sync_playwright
import config
import utils

# Global Variables
p = None
browser = None
context = None
page = None
iframe = None
browser_lock = threading.Lock()
playwright_executor = ThreadPoolExecutor(max_workers=1)

def ensure_browser_and_iframe(force_dashboard=False):
    """
    Ensure browser is running and iframe is loaded.
    
    Args:
        force_dashboard: If True, navigate to dashboard even if on order page
        
    Returns:
        Tuple of (page, iframe)
    """
    global p, browser, context, page, iframe

    if not os.path.exists(config.STATE_PATH):
        raise FileNotFoundError(f"State file '{config.STATE_PATH}' not found. Run login first.")

    with browser_lock:
        # Start Playwright if needed
        if p is None:
            utils.consoleprint("Starting Playwright...")
            p = sync_playwright().start()

        # Launch browser if needed
        if browser is None:
            utils.consoleprint("Launching browser...")
            browser = p.chromium.launch(
                headless=False,  # Set True for production
                args=["--disable-blink-features=AutomationControlled"]
            )
            context = browser.new_context(
                storage_state=config.STATE_PATH,
                viewport={"width": 1920, "height": 1080},
                user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36",
            )
            page = context.new_page()
            
        # Navigate to messages page if needed
        if force_dashboard or ("dashboard/messages" not in page.url and "order" not in page.url):
            utils.consoleprint("Navigating to messages page...")
            page.goto("https://www.eldorado.gg/dashboard/messages", timeout=60000)
            page.wait_for_load_state("networkidle")
            iframe = None 

        # Find TalkJS iframe if needed
        if iframe is None:
            if "dashboard/messages" in page.url:
                utils.consoleprint("Searching for TalkJS iframe...")
                timeout_ms = 15000
                step = 500
                waited = 0
                found_iframe = None
                
                while waited < timeout_ms and found_iframe is None:
                    for f in page.frames:
                        url = (f.url or "").lower()
                        if "talkjs" in url or "chat" in url or "inbox" in url:
                            found_iframe = f
                            break
                    if found_iframe:
                        break
                    page.wait_for_timeout(step)
                    waited += step
                    
                iframe = found_iframe
                if iframe:
                    utils.consoleprint("TalkJS iframe initialized.")

        return page, iframe

def get_page():
    """Get the current page object."""
    global page
    return page

def get_iframe():
    """Get the current iframe object."""
    global iframe
    return iframe

def close_browser():
    """Close browser and cleanup resources."""
    global p, browser, context, page, iframe
    
    with browser_lock:
        if browser:
            browser.close()
            browser = None
        if p:
            p.stop()
            p = None
        context = None
        page = None
        iframe = None
        utils.consoleprint("Browser closed.")
