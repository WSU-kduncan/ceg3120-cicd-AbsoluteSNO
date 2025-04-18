# Stage 1: Build the Angular app
FROM node:18-alpine AS build

# Set working directory inside the container
WORKDIR /app

# Copy dependency files first (for layer caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the full source code into the container
COPY . .

# Build the Angular app (output goes to dist/wsu-hw-ng)
RUN npm run build

# Stage 2: Serve the app using Nginx
FROM nginx:alpine

# Copy Angular output to NGINX's public folder
COPY --from=build /app/dist/wsu-hw-ng /usr/share/nginx/html

# Optional: remove default NGINX config (if you want custom routing, etc.)
# RUN rm /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
