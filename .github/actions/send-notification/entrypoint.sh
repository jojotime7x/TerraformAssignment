#!/bin/sh

# Print all environment variables
env

# Debug: Print environment variables
echo "Webhook URL: ${INPUT_WEBHOOK_URL}"
echo "Message: ${INPUT_MESSAGE}"

# Fetch environment variables set by GitHub Actions
WEBHOOK_URL="${INPUT_WEBHOOK_URL}"
MESSAGE="${INPUT_MESSAGE}"

# Send the notification to Slack
if [ -z "$WEBHOOK_URL" ]; then
    echo "Webhook URL is not set. Please check your GitHub Action configuration."
else
    curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"${MESSAGE}\"}" "$WEBHOOK_URL"
fi
