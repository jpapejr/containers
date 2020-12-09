# Use a minimal base image.
FROM alpine:latest

# Install supplementary tools.
RUN ["apk", "add", "curl"]

# Download and run the setup script.
RUN curl -fsSL https://raw.githubusercontent.com/mutagen-io/mutagen/master/scripts/container/provision.sh | sh

# Set tunnel hosting to be the container entrypoint.
ENTRYPOINT ["mutagen", "tunnel", "host"]
