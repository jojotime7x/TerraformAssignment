#!/bin/sh

# Debug: Print environment variables
echo "Webhook URL: ${INPUT_WEBHOOK-URL}"
echo "Message: ${INPUT_MESSAGE}"

# Fetch environment variables set by GitHub Actions
WEBHOOK_URL=${INPUT_WEBHOOK-URL}
MESSAGE=${INPUT_MESSAGE}



# Send the notification to Slack
curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"${MESSAGE}\"}" "${WEBHOOK_URL}"
