#!/bin/sh

#!/bin/sh

# Print all environment variables for debugging
env

# Or specifically print out the expected input
echo "Webhook URL: '${INPUT_WEBHOOK_URL}'"

# Ensure that script fails if any command fails
set -e

# Debug: Print environment variables
echo "Received Webhook URL: '${INPUT_WEBHOOK_URL}'"
echo "Received Message: '${INPUT_MESSAGE}'"

# Validate that webhook URL is provided
if [ -z "${INPUT_WEBHOOK_URL}" ]; then
  echo "Webhook URL is not set. Please check your GitHub Action configuration."
  exit 1
fi

# Prepare the message payload
PAYLOAD=$(jq -nc --arg text "$INPUT_MESSAGE" '{"text": $text}')

# Send the notification to Slack
curl -X POST -H 'Content-type: application/json' --data "$PAYLOAD" "${INPUT_WEBHOOK_URL}"
