#!/bin/sh

# Debug: Print environment variables
echo "Webhook URL: ${webhook-url}"
echo "Message: ${message}"

# Fetch environment variables set by GitHub Actions
WEBHOOK_URL=${INPUT_WEBHOOK_URL}
MESSAGE=${INPUT_MESSAGE}



# Send the notification to Slack
curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"${MESSAGE}\"}" "${WEBHOOK_URL}"
