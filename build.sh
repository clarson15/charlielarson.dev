#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Variables
IMAGE_NAME="$REGISTRY/$REGISTRY_USERNAME/charlielarson.dev"

# Log in to the Docker registry
echo "$REGISTRY_PASSWORD" | docker login $REGISTRY -u "$REGISTRY_USERNAME" --password-stdin

# Build the Docker image
docker build -t "$IMAGE_NAME:$BUILD_VERSION" -t "$IMAGE_NAME:latest" .

# Push the Docker image to the registry
docker push "$IMAGE_NAME:$BUILD_VERSION"

docker push "$IMAGE_NAME:latest"

# Log out from the Docker registry
docker logout $REGISTRY

echo "Docker image $IMAGE_NAME:$BUILD_VERSION has been successfully built and pushed to $REGISTRY."