FROM ubuntu:20.04

# Create non-root user
RUN useradd -m -s /bin/bash aftuser

# Build-time argument for config folder
ARG CONFIG_DIR="AFT Extension Manager"

# Set working directory
WORKDIR /app

# Copy the binary and make it executable
COPY aft-extensions-manager-linux ./aft-extensions-manager-linux
RUN chmod +x ./aft-extensions-manager-linux

# Create folder for config and copy configuration.yaml
RUN mkdir -p "/app/$CONFIG_DIR"
COPY configuration.yaml "/app/$CONFIG_DIR/configuration.yaml"

# Ensure everything is owned by non-root user
RUN chown -R aftuser:aftuser /app

# Switch to non-root user
USER aftuser

# Expose port
EXPOSE 38925

# Start the binary
CMD ["./aft-extensions-manager-linux"]