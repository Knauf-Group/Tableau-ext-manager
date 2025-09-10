# Use a minimal Debian base image (amd64 variant)
FROM --platform=$BUILDPLATFORM debian:bookworm-slim

# Build-time arguments
ARG BINARY_NAME=aft-extensions-manager-linux

# Set working directory
WORKDIR /app

# Install required tools (file, wget), then clean up
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        wget \
        file && \
    rm -rf /var/lib/apt/lists/*

# Copy application files
COPY ${BINARY_NAME} ./${BINARY_NAME}

# Set proper permissions
RUN chmod +x ./${BINARY_NAME}

# Expose the application port
EXPOSE 38209

# Use tini as PID 1
ENTRYPOINT ["/usr/bin/tini", "--"]

# Run the binary as main process
CMD ["./aft-extensions-manager-linux"]
