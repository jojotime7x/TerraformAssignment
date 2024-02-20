#!/bin/bash

# The webhook URL and message are passed as environment variables
SLACK_WEBHOOK_URL=$1
MESSAGE=$2

# Send the notification to Slack
curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"${MESSAGE}\"}" $SLACK_WEBHOOK_URL
