FROM alpine:3.17

# Install curl and jq
RUN apk add --no-cache curl jq

# Copy the entrypoint script into the container
COPY entrypoint.sh /entrypoint.sh

# Make sure the script is executable
RUN chmod +x /entrypoint.sh

# Set the script to be the entrypoint when the container starts
ENTRYPOINT ["/entrypoint.sh"]
