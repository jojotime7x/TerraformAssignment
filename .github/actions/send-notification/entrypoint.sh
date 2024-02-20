#!/bin/bash

# GitHub Actions will set inputs as environment variables
# Note: GitHub Actions automatically prefixes inputs with `INPUT_` and converts them to uppercase
WEBHOOK_URL=${INPUT_WEBHOOK-URL}
MESSAGE=${INPUT_MESSAGE}

# Send the notification to Slack
curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"${MESSAGE}\"}" ${WEBHOOK_URL}
