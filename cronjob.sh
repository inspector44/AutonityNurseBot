#!/bin/bash

# Follow Readme.md, It will set your variables if you follow the steps. You don't need to change anything here.
TOKEN="YOUR_TOKEN_HERE"
CHAT_ID="YOUR_CHAT_ID_HERE"
VALIDATOR_ADDRESS="YOUR_VALIDATOR_ADDRESS_HERE"

# Function to send message to Telegram
sendMessageToTelegram() {
    message=$1
    if [ -z "$message" ]; then
        message="Error: Command produced no output."
    fi
    /usr/bin/curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" \
        -d chat_id="$CHAT_ID" \
        -d text="$message"
}

# Get the status and assign it to the result variable
validatorInfoResult=$(/root/.local/bin/aut validator info --validator "$VALIDATOR_ADDRESS" 2>&1)
committeeInfoResult=$(/root/.local/bin/aut protocol get-committee | grep "$VALIDATOR_ADDRESS" 2>&1)

# Send the results to the specified Telegram channel
sendMessageToTelegram "$validatorInfoResult"
sendMessageToTelegram "$committeeInfoResult"
