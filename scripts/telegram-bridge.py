#!/usr/bin/env python3
"""
Telegram Bot Bridge for Second Brain
Dumps messages to 00-Inbox/mobile-dump.md

Setup:
1. Message @BotFather on Telegram, create a bot, get token
2. pip install python-telegram-bot
3. export TELEGRAM_BOT_TOKEN="your_token_here"
4. python scripts/telegram-bridge.py
5. Message your bot — notes appear in 00-Inbox/mobile-dump.md
6. Run 'brain process' in the evening to process them
"""

import os
import sys
import asyncio
from datetime import datetime
from telegram import Update
from telegram.ext import Application, MessageHandler, filters, ContextTypes

VAULT = os.environ.get("BRAIN_VAULT", os.path.expanduser("~/brain"))
INBOX = os.path.join(VAULT, "00-Inbox")


async def handle_message(update: Update, context: ContextTypes.DEFAULT_TYPE):
    """Handle incoming Telegram messages."""
    message = update.message
    if not message or not message.text:
        return

    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    user = message.from_user.username or message.from_user.first_name

    dump_file = os.path.join(INBOX, "mobile-dump.md")
    with open(dump_file, "a", encoding="utf-8") as f:
        f.write(f"\n---\n")
        f.write(f"**Date:** {timestamp}\n")
        f.write(f"**From:** {user} (Telegram)\n")
        f.write(f"**Content:** {message.text}\n")

    await message.reply_text("🧠 Captured to your second brain inbox!")


async def main():
    token = os.environ.get("TELEGRAM_BOT_TOKEN")
    if not token:
        print("Error: Set TELEGRAM_BOT_TOKEN environment variable")
        sys.exit(1)

    os.makedirs(INBOX, exist_ok=True)

    app = Application.builder().token(token).build()
    app.add_handler(MessageHandler(filters.TEXT & ~filters.COMMAND, handle_message))

    print("🤖 Telegram bridge running...")
    print("Send messages to your bot to capture them.")
    await app.run_polling()


if __name__ == "__main__":
    asyncio.run(main())
