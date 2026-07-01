#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

NEXUS_REGISTRY="localhost:8082"
IMAGE_NAME="trikifun"
TAG="latest"

echo "==========================================="
echo "Pushing Docker Image to Local Nexus Registry"
echo "==========================================="

# Tag the image for Nexus
echo "Tagging image: $IMAGE_NAME:$TAG -> $NEXUS_REGISTRY/$IMAGE_NAME:$TAG"
docker tag "$IMAGE_NAME:$TAG" "$NEXUS_REGISTRY/$IMAGE_NAME:$TAG"

# Login and Push (expects local credentials or default)
# docker login $NEXUS_REGISTRY -u admin -p admin123
echo "Pushing image to Nexus registry..."
docker push "$NEXUS_REGISTRY/$IMAGE_NAME:$TAG"

echo "Image successfully pushed to local Nexus!"
