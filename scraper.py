# scraper.py - Web Scraping Functions for Eldorado.gg

import browser
import utils

from collections import deque

# Track last conversation for new chat detection
last_top_chat_signature = None
# Track notified ORDER IDs to prevent duplicate notifications (auto-removes oldest when full)
notified_order_ids = deque(maxlen=100)


def scrape_chats_list():
    """Scrape the list of recent conversations."""
    utils.consoleprint("Starting chat list scrape...")
    try:
        _, frame = browser.ensure_browser_and_iframe(force_dashboard=True)

        scrape_script = """
        () => {
            const items = document.querySelectorAll("#hub-scrollable nav a.ConversationListItem__conversation-link");
            const out = [];
            items.forEach(a => {
                const name = a.querySelector(".ConversationListItem__conversation-name")?.innerText?.trim() || "Unknown";
                const itemEl = a.querySelector(".ConversationListItem__body .ConversationListItem__conversation-user-names span");
                let item = itemEl ? itemEl.innerText.trim() : "No Item";
                item = item.replace(/^Order for\\s+/i, "");
                const time = a.querySelector(".ConversationListItem__timestamp span[aria-hidden='true']")?.innerText?.trim() || "";
                const msg = a.querySelector(".ConversationListItem__message")?.innerText?.trim() || "No message";
                out.push({ name, item, time, message: msg });
            });
            return out;
        }
        """
        chats = frame.evaluate(scrape_script)
        return {"chats": chats}
    except Exception as e:
        utils.consoleprint(f"Error in scrape_chats_list: {e}")
        return {"error": str(e)}


def scrape_specific_conversation(target_username: str):
    """Scrape chat history with a specific user."""
    utils.consoleprint(f"Fetching chat: {target_username}")
    try:
        page, frame = browser.ensure_browser_and_iframe(force_dashboard=True)
        
        with browser.browser_lock:
            user_selector = f"#hub-scrollable .ConversationListItem__conversation-link:has(.ConversationListItem__conversation-name:has-text('{target_username}'))"
            locator = frame.locator(user_selector).first
            
            if locator.count() == 0:
                return {"error": f"User '{target_username}' not found."}

            locator.scroll_into_view_if_needed()
            locator.click()
            page.wait_for_timeout(2000)

            chat_selector = "#chat-scrollable > div.MessageList > div.transition-group"
            try:
                frame.wait_for_selector(chat_selector, timeout=5000)
            except:
                pass
            html_content = frame.inner_html(chat_selector)

        return utils.parse_html_to_text(html_content)
    except Exception as e:
        utils.consoleprint(f"Error in scrape_specific: {e}")
        return {"error": str(e)}


def navigate_to_order_page(target_username: str):
    """Navigate to the order page for a specific user."""
    utils.consoleprint(f"Navigating to order for: {target_username}")
    try:
        page, frame = browser.ensure_browser_and_iframe(force_dashboard=True)
        
        with browser.browser_lock:
            # 1. Open Chat
            user_selector = f"#hub-scrollable .ConversationListItem__conversation-link:has(.ConversationListItem__conversation-name:has-text('{target_username}'))"
            locator = frame.locator(user_selector).first
            
            if locator.count() == 0:
                return {"error": f"User '{target_username}' not found."}

            locator.click()
            page.wait_for_timeout(2000)

            # 2. Find Order URL in chat
            find_url_script = """
            () => {
                const msgs = document.querySelectorAll(".MessageDiv");
                for (let div of msgs) {
                    const text = div.innerText;
                    const match = text.match(/https:\\/\\/www\\.eldorado\\.gg\\/order\\/[a-f0-9\\-]+/);
                    if (match) return match[0];
                }
                return null;
            }
            """
            order_url = frame.evaluate(find_url_script)

            if not order_url:
                return {"error": "No order URL found in chat history."}
            
            # 3. Go to Order Page
            utils.consoleprint(f"Found URL: {order_url}. Navigating...")
            page.goto(order_url, timeout=30000)
            
            try:
                page.wait_for_selector("eld-seller-order-details-card", timeout=10000)
                page.wait_for_timeout(2000)
            except:
                pass
            
            browser.iframe = None
            return {"success": True, "url": order_url}

    except Exception as e:
        return {"error": str(e)}


def scrape_current_order_page():
    """Scrape details from the current order page."""
    try:
        with browser.browser_lock:
            page = browser.page
            
            details_script = """
            () => {
                // 1. Get Item/Offer name from header
                let itemName = "N/A";
                const offerTitle = document.querySelector("eld-order-header .offer-title");
                if (offerTitle) {
                    itemName = offerTitle.innerText.trim();
                }
                
                // 2. Get Order ID from header
                let orderId = "N/A";
                const orderHeader = document.querySelector("eld-order-header");
                if (orderHeader) {
                    const orderIdSpan = orderHeader.querySelector(".order-id span");
                    if (orderIdSpan) {
                        const text = orderIdSpan.innerText || "";
                        const match = text.match(/([a-f0-9-]{36})/i);
                        if (match) orderId = match[1];
                    }
                }
                
                // 3. Helper to get values from the Details Card
                const card = document.querySelector("eld-seller-order-details-card");
                const getVal = (label) => {
                    if (!card) return "N/A";
                    const rows = Array.from(card.querySelectorAll(".flex.items-center.justify-between"));
                    const row = rows.find(r => r.innerText.includes(label));
                    if (!row) return "N/A";
                    const valEl = row.querySelector(".text-primary");
                    return valEl ? valEl.innerText.trim() : "N/A";
                };
                
                const game = getVal("Game");
                const buyer = getVal("Buyer");
                
                // Quantity might be in different places - try multiple selectors
                let quantity = getVal("Quantity");
                if (quantity === "N/A") {
                    // Try looking in payment details or other sections
                    const allText = document.body.innerText;
                    const qtyMatch = allText.match(/Quantity[:\\s]+([\\d,.]+\\s*[KkMm]?)/i);
                    if (qtyMatch) quantity = qtyMatch[1].trim();
                }
                // Also try to find it in the offer description
                if (quantity === "N/A" && itemName !== "N/A") {
                    // Sometimes quantity is in the item name like "100K Gold"
                    const numMatch = itemName.match(/^([\\d,.]+\\s*[KkMm]?)\\s/);
                    if (numMatch) quantity = numMatch[1];
                }
                
                // Default to "1" for single item orders
                if (quantity === "N/A") {
                    quantity = "1";
                }
                
                // 4. Get Status from Order Header
                let status = "Unknown";
                if (orderHeader) {
                    const chip = orderHeader.querySelector("eld-chip");
                    if (chip) status = chip.innerText.trim();
                }

                // 5. Get Earnings
                let earnings = "N/A";
                const paymentDiv = document.querySelector(".order-seller-payment");
                if (paymentDiv) {
                    const rows = Array.from(paymentDiv.querySelectorAll("div"));
                    const receiveRow = rows.find(r => r.innerText.includes("You receive"));
                    if (receiveRow) {
                        const valSpan = receiveRow.querySelector("span");
                        if (valSpan) earnings = valSpan.innerText.trim();
                    }
                }

                // 6. Get Delivery Time
                let deliveryTime = "N/A";
                const timerDiv = document.querySelector(".delivery-time-container");
                if (timerDiv) {
                    const blocks = Array.from(timerDiv.querySelectorAll(".timer-block"));
                    const parts = blocks.map(b => {
                        const num = b.querySelector(".text-lg")?.innerText?.trim() || "0";
                        const unit = b.querySelector(".text-secondary")?.innerText?.trim() || "";
                        return `${num} ${unit}`;
                    });
                    if (parts.length > 0) deliveryTime = parts.join(" ");
                }

                return { itemName, orderId, game, quantity, buyer, earnings, deliveryTime, status };
            }
            """
            data = page.evaluate(details_script)

            # Chat History Extraction
            chat_html = ""
            found_chat_frame = None
            
            for f in page.frames:
                try:
                    if f.locator(".MessageList").count() > 0:
                        found_chat_frame = f
                        break
                except:
                    continue

            if found_chat_frame:
                try:
                    chat_html = found_chat_frame.inner_html("#chat-scrollable")
                except:
                    chat_html = ""
            else:
                try:
                    if page.locator("#chat-scrollable").count() > 0:
                        chat_html = page.inner_html("#chat-scrollable")
                except:
                    pass

            data["chat_html"] = chat_html
            return {"success": True, "data": data}
            
    except Exception as e:
        return {"error": str(e)}


def close_order_page_logic():
    """Close order page and return to dashboard."""
    try:
        with browser.browser_lock:
            utils.consoleprint("Closing order page, returning to dashboard.")
            browser.page.goto("https://www.eldorado.gg/dashboard/messages")
            browser.iframe = None
    except Exception as e:
        utils.consoleprint(f"Error closing order page: {e}")


def send_message_logic(message_text: str):
    """Send a message in the current chat."""
    try:
        with browser.browser_lock:
            page = browser.page
            utils.consoleprint(f"Attempting to send message: {message_text}")
            selector = "div.ProseMirror[contenteditable='true']"
            
            target = page
            if page.locator(selector).count() == 0:
                found = False
                for f in page.frames:
                    if f.locator(selector).count() > 0:
                        target = f
                        found = True
                        break
                if not found:
                    return {"error": "Chat input box not found on page."}

            box = target.locator(selector).first
            box.click()
            page.wait_for_timeout(200)
            page.keyboard.type(message_text, delay=50)
            page.wait_for_timeout(200)
            page.keyboard.press("Enter")
            return {"success": True}

    except Exception as e:
        utils.consoleprint(f"Error sending message: {e}")
        return {"error": str(e)}


def check_new_top_conversation():
    """Check if there's a new conversation at the top of the list from a CUSTOMER (not from you)."""
    global last_top_chat_signature
    try:
        # Don't check if on order page
        if browser.page and "order" in browser.page.url:
            return None

        _, frame = browser.ensure_browser_and_iframe()
        
        script = """
        () => {
            const a = document.querySelector("#hub-scrollable nav a.ConversationListItem__conversation-link");
            if (!a) return null;
            const name = a.querySelector(".ConversationListItem__conversation-name")?.innerText?.trim() || "Unknown";
            const time = a.querySelector(".ConversationListItem__timestamp span[aria-hidden='true']")?.innerText?.trim() || "";
            const msg = a.querySelector(".ConversationListItem__message")?.innerText?.trim() || "No message";
            
            const msgElement = a.querySelector(".ConversationListItem__message");
            let isFromYou = false;
            let isSystemMessage = false;
            let orderId = null;
            
            if (msgElement) {
                const fullText = msgElement.innerText || "";
                
                // Check for "You:" prefix which indicates your message
                if (fullText.startsWith("You:") || fullText.startsWith("You :")) {
                    isFromYou = true;
                }
                
                // Check for system messages (Order Created, Order Delivered, etc.)
                const lowerText = fullText.toLowerCase();
                if (lowerText.includes("order created") || 
                    lowerText.includes("order delivered") ||
                    lowerText.includes("received goods or services") ||
                    lowerText.includes("mark this order") ||
                    lowerText.includes("trustpilot") ||
                    lowerText.includes("leave feedback") ||
                    fullText.includes("eldorado.gg/order/")) {
                    isSystemMessage = true;
                }
                
                // Extract order ID from URL if present
                const orderMatch = fullText.match(/eldorado\\.gg\\/order\\/([a-f0-9-]+)/i);
                if (orderMatch) {
                    orderId = orderMatch[1];
                }
            }
            
            return { name, time, message: msg, isFromYou, isSystemMessage, orderId };
        }
        """
        top_chat = frame.evaluate(script)
        if not top_chat:
            return None

        current_signature = f"{top_chat['name']}::{top_chat['message']}"

        if last_top_chat_signature is None:
            last_top_chat_signature = current_signature
            return None

        if current_signature != last_top_chat_signature:
            last_top_chat_signature = current_signature
            
            # Only notify if message is FROM CUSTOMER (not from you)
            if top_chat.get('isFromYou', False):
                utils.consoleprint(f"New message from YOU detected (ignoring): {current_signature}")
                return None
            
            # Check if this is a SYSTEM message with an order ID
            if top_chat.get('isSystemMessage', False):
                order_id = top_chat.get('orderId')
                
                if order_id:
                    # Check if we've already notified for this order
                    if order_id in notified_order_ids:
                        utils.consoleprint(f"Order {order_id[:8]}... already notified - skipping duplicate")
                        return None
                    
                    # New order - add to notified deque (auto-removes oldest if > 100)
                    notified_order_ids.append(order_id)
                    utils.consoleprint(f"New Order detected: {order_id[:8]}...")
                    
                    return top_chat
                else:
                    # System message without order ID (like "Order Delivered") - skip
                    utils.consoleprint(f"System message without order ID (ignoring): {current_signature[:50]}...")
                    return None
            
            # Regular customer message - always notify
            utils.consoleprint(f"New Customer Message! {current_signature}")
            return top_chat
            
        return None
    except Exception as e:
        utils.consoleprint(f"Error in check_new_top_conversation: {e}")
        return None


# --- ACTION FUNCTIONS ---

def action_mark_delivered():
    """Click the 'Order delivered' button."""
    try:
        with browser.browser_lock:
            utils.consoleprint("Attempting to click 'Order Delivered'...")
            page = browser.page
            
            btn = page.locator("[data-testid='order-page-seller-order-delivered-button-xm0D']").first
            if btn.count() == 0:
                btn = page.locator("eld-button[text='Order delivered'] button").first
            
            if btn.count() == 0:
                return {"error": "Deliver button not found on page."}
            
            btn.click()
            page.wait_for_timeout(1000)
            page.keyboard.press("Enter")
            
            return {"success": True}
    except Exception as e:
        return {"error": str(e)}


def action_cancel_order():
    """
    Cancel the order by:
    1. Clicking 'Cancel order' button to open modal
    2. Selecting 'Out of stock' reason
    3. Clicking the confirm button
    """
    try:
        with browser.browser_lock:
            utils.consoleprint("Attempting to Cancel Order...")
            page = browser.page
            
            btn = page.locator("eld-button:has-text('Cancel order') button, button:has-text('Cancel order')").first
            if btn.count() == 0:
                return {"error": "Initial 'Cancel' button not found."}
            
            btn.click()
            utils.consoleprint("Clicked initial cancel. Waiting for modal...")
            page.wait_for_timeout(1500)
            
            oos_option = page.locator("eld-radio-option label:has-text('Out of stock')").first
            
            if oos_option.count() == 0:
                oos_option = page.locator(".modal-content label:has-text('Out of stock')").first
            
            if oos_option.count() > 0:
                oos_option.click()
                utils.consoleprint("Selected 'Out of stock' reason.")
                page.wait_for_timeout(500)
            else:
                return {"error": "'Out of stock' reason option not found in modal."}

            confirm_btn = page.locator("eld-seller-cancel-order-modal eld-button button:has-text('Cancel order')").first
            
            if confirm_btn.count() == 0:
                confirm_btn = page.locator("eld-modal button:has-text('Cancel order')").first

            if confirm_btn.count() > 0:
                confirm_btn.click()
                utils.consoleprint("Clicked Confirm Cancel.")
                page.wait_for_timeout(1000)
                return {"success": True}
            else:
                return {"error": "Confirm cancel button not found in modal."}

    except Exception as e:
        return {"error": str(e)}
