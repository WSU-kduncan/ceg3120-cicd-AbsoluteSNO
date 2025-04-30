#!/bin/bash

# Navigate to the deployment directory
cd /home/ubuntu/ceg3120-cicd-AbsoluteSNO/deployment

# Pull the latest image from DockerHub
docker pull absolutesno/earl-ceg3120:latest

# Stop the currently running container
docker stop angular-site

# Remove the stopped container
docker rm angular-site

# Run a new container with the latest image
docker run -d -p 80:80 --name angular-site absolutesno/earl-ceg3120:latest

