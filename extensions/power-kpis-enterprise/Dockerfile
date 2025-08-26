# Use a minimal Debian base image
FROM debian:bookworm-slim

# Build-time arguments
ARG BINARY_NAME=power-kpis-linux
ARG LICENSE_FILE=license.lic
ARG CONFIG_FILE=config.yml

# Set working directory
WORKDIR /app

# Copy application files
COPY app/${BINARY_NAME} ./${BINARY_NAME}
COPY app/${LICENSE_FILE} ./${LICENSE_FILE}
COPY app/${CONFIG_FILE} ./${CONFIG_FILE}
COPY app/static ./static

# Copy static files
COPY app/static ./static

# Set proper permissions
RUN chmod +x ./${BINARY_NAME} && \
    chmod 644 ./${LICENSE_FILE} ./${CONFIG_FILE} && \
    chmod -R 644 ./static

# Expose the application port
EXPOSE 8002

# Run the binary as web server serving static files
CMD ["./power-kpis-linux",  "--config", "config.yml" ]
