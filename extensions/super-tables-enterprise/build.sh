#!/bin/bash
set -euo pipefail

# Variables
IMAGE_NAME="super-tables"
IMAGE_VERSION="1.0"
TAG="${IMAGE_NAME}:${IMAGE_VERSION}"
PLATFORM="${PLATFORM:-linux/amd64}"  # Default to amd64 if not set

# Build
docker build \
  --platform "${PLATFORM}" \
  -t "${TAG}" \
  --load \
  .

# Run
docker rm -f "${IMAGE_NAME}" 2>/dev/null || true

docker run -it \
  --platform "${PLATFORM}" \
  --name "${IMAGE_NAME}" \
  -p 8001:8001 \
  "${TAG}"
