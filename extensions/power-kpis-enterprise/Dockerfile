# Use a minimal Debian base image (amd64 variant)
FROM --platform=linux/amd64 debian:bookworm-slim

# Build-time arguments
ARG BINARY_NAME=super-tables-linux
ARG LICENSE_FILE=license.lic

# Set working directory
WORKDIR /app

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
CMD ["./power-kpis-linux",  "--config", "config.yml" ]
