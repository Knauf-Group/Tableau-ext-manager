# Use a minimal Debian base image (amd64 variant)
FROM --platform=$BUILDPLATFORM debian:bookworm-slim

# Build-time arguments
ARG BINARY_NAME=super-tables-linux
ARG LICENSE_FILE=license.lic

# Set working directory
WORKDIR /app

# Install required tools (file, wget), then clean up
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        wget \
        file && \
    rm -rf /var/lib/apt/lists/*

# Copy application files
COPY app/${BINARY_NAME} ./${BINARY_NAME}
COPY app/${LICENSE_FILE} ./${LICENSE_FILE}
COPY app/static ./static

# Set proper permissions
RUN chmod +x ./${BINARY_NAME} && \
    chmod 644 ./${LICENSE_FILE} && \
    chmod -R 644 ./static

# Expose the application port
EXPOSE 80

# Run the binary as web server serving static files
CMD ["./super-tables-linux",  "--config", "config.yml" ]