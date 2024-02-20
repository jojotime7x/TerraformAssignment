#!/bin/sh

echo "Webhook URL: ${INPUT_WEBHOOK_URL}"
echo "Message: ${INPUT_MESSAGE}"

WEBHOOK_URL=${INPUT_WEBHOOK_URL}
MESSAGE=${INPUT_MESSAGE}

curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"${MESSAGE}\"}" "${WEBHOOK_URL}"
