#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "---- Starting deployment script ----"

# Load environment variables if .env exists
ENV_FILE="$(dirname "$0")/.env"
if [ -f "$ENV_FILE" ]; then
    echo "Loading environment variables from .env..."
    export $(grep -v '^#' "$ENV_FILE" | xargs)
fi

# Configurations
IMAGE_NAME="absolutesno/earl-ceg3120:latest"
CONTAINER_NAME="angular-site"
PORT_MAPPING="80:80"

echo "Pulling the latest Docker image from DockerHub..."
docker pull $IMAGE_NAME

# Check if the container is running
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "Stopping running container..."
    docker stop $CONTAINER_NAME
fi

# Check if the container exists
if [ "$(docker ps -a -q -f name=$CONTAINER_NAME)" ]; then
    echo "Removing old container..."
    docker rm $CONTAINER_NAME
fi

# Run the new container
echo "Starting a new container from the latest image..."
docker run -d --name $CONTAINER_NAME -p $PORT_MAPPING $IMAGE_NAME

echo "---- Deployment completed successfully! ----"
