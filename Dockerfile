# Base image with Node.js 18 on Alpine (lightweight)
FROM node:18-alpine

# Set working directory in container
WORKDIR /app

# Copy package files first to leverage Docker caching
COPY angular-site/package*.json ./

# Install dependencies using clean install (exact versions from lockfile)
RUN npm ci

# Copy Angular application source code
COPY angular-site/ .

# Build Angular application for production
RUN npm run build -- --configuration=production

# Install lightweight static server (alternatively use nginx in multi-stage build)
RUN npm install -g serve

# Specify runtime command (serve built application)
CMD ["serve", "-s", "dist", "-l", "3000"]