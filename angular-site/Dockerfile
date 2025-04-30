# Stage 1: Build Angular app
FROM node:18-alpine AS build

WORKDIR /app

# Install build dependencies
COPY package*.json ./
RUN npm install

# Copy source
COPY . ./

# Make sure ng CLI is executable
RUN chmod +x node_modules/.bin/ng

# Build the app (make sure build script exists)
RUN npm run build

# Stage 2: Serve with nginx
FROM nginx:alpine

# Copy built app to nginx public directory
COPY --from=build /app/dist/wsu-hw-ng /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
