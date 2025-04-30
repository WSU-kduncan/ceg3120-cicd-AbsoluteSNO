#!/bin/bash

# Configuration
CONTAINER_NAME="angular-app"
IMAGE_NAME="absolutesno/earl-ceg3120:latest"
HOST_PORT=8080
CONTAINER_PORT=80

# Step 1: Stop and remove existing container (if exists)
echo "Removing existing container if present..."
docker rm -f $CONTAINER_NAME 2>/dev/null || true

# Step 2: Pull the latest image
echo "Pulling latest image..."
docker pull $IMAGE_NAME

# Step 3: Run new container
echo "Starting new container..."
docker run -d \
  --name $CONTAINER_NAME \
  -p $HOST_PORT:$CONTAINER_PORT \
  $IMAGE_NAME

# Verification
echo "Verification:"
echo "- Container status:"
docker ps --filter "name=$CONTAINER_NAME" --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"

echo "- Recent logs:"
"deploy.sh" 32L, 838B
