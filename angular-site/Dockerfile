# Stage 1: Build Angular app
FROM node:18-alpine AS build

WORKDIR /app

# Install build dependencies
COPY angular-site/package*.json ./
RUN npm install

# Copy source
COPY angular-site/ ./

# Build the app (make sure build script exists)
RUN npm run build
RUN chmod +x node_modules/.bin/ng

# Stage 2: Serve with nginx
FROM nginx:alpine

# Copy built app to nginx public directory
COPY --from=build /app/dist/wsu-hw-ng /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
