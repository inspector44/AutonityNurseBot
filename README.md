## 🚀 Introduction
This repository provides a simple yet effective way to monitor the health and status of your Autonity validator node. Using a Telegram bot, you can receive updates about your node directly on your phone, eliminating the need for costly monitoring tools. The setup is straightforward and completely free of charge.

## 🛠 Installation & Configuration

### 1️⃣ Creating a Telegram Bot
1. Open Telegram and search for the "BotFather" user 
2. Start a chat and send the command /newbot (Or click the /newbot)
3. Follow the on-screen instructions to name your bot and choose a username for it.
4. Once the bot is created, BotFather will provide you with a TOKEN which looks something like this: 110201543:AAHdqTcvCH1vGWJxfSeofSAs0K5PALDsaw. Save this token for later.

### 2️⃣ Creating a Telegram Channel
1. In Telegram, click on the pencil icon (or the three dots) in the top right corner.
2. Choose 'New Channel'.
3. Name your channel and provide an optional description.
4. Set your channel to either public or private. Note: If you choose 'Public', you'll get a public link which others can use to join your channel.
5. Once the channel is created, click on the channel name at the top, then click on 'Administrators'.
6. Add your previously created bot to the channel as an administrator. Make sure to grant it the necessary permissions, especially 'Send Messages'.

### 3️⃣ Finding the Chat ID of the Channel
1. Send a message in the channel.
2. Open a browser and visit the following URL (replace YOUR_TOKEN_HERE with the bot token you got from BotFather): https://api.telegram.org/botYOUR_TOKEN_HERE/getUpdates
It should looks like this; https://api.telegram.org/bot110201543:AAHdqTcvCH1vGWJxfSeofSAs0K5PALDsaw/getUpdates
4. Look for the "chat" object in the returned JSON. The id field inside this object is your channel's chat ID. It should look something like -1001234567890. Save this ID for later.

### 4️⃣ Setting Up the Cron Job for Autonity
1. Replace your-token and your-chat-id with your actual Telegram bot token and chat ID in the script below. Then run it on the terminal of your Autonity node:

```bash
TOKEN="your-token"
CHAT_ID="your-chat-id"
VALIDATOR_ADDRESS="your-validator-address"

cd ~ && \
curl -s https://raw.githubusercontent.com/inspector44/AutonityNurseBot/main/cronjob.sh | \
sed "s/YOUR_TOKEN_HERE/$TOKEN/g; s/YOUR_CHAT_ID_HERE/$CHAT_ID/g; s/YOUR_VALIDATOR_ADDRESS_HERE/$VALIDATOR_ADDRESS/g" > autonity_cronjob.sh && \
chmod +x autonity_cronjob.sh && \
(crontab -l 2>/dev/null; echo "*/30 * * * * $PWD/autonity_cronjob.sh") | crontab -
```


### 5️⃣ Test & Monitor
1. Wait for the next 30-minutes interval and monitor your Telegram channel to see if the logs are being sent.
2. If there are any issues, double-check the crontab command, the token, and the chat ID.

Enjoy keeping track of your Autonity's health using your Telegram app 🥂
