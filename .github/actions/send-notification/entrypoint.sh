#!/bin/sh

# Debug: Print the received inputs
echo "Received Webhook URL: '${INPUT_WEBHOOK_URL}'"
echo "Received Message: '${INPUT_MESSAGE}'"

# Validate that the webhook URL is provided
if [ -z "${INPUT_WEBHOOK_URL}" ]; then
    echo "Webhook URL is not set. Please check your GitHub Action configuration."
    exit 1
fi

# Prepare the JSON payload
PAYLOAD=$(jq -n --arg text "$INPUT_MESSAGE" '{text: $text}')

# Send the notification to Slack
curl -X POST -H "Content-type: application/json" --data "$PAYLOAD" "${INPUT_WEBHOOK_URL}"
