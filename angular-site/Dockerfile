# Stage 1: Build the Angular app
FROM node:18-alpine AS build

WORKDIR /app

# Copy dependency manifests and install
COPY package*.json ./
RUN npm install

# Copy the rest of the source and build
COPY . .
RUN npm run build

# Stage 2: Serve the app with Nginx
FROM nginx:alpine

# Copy the built app from the build stage
COPY --from=build /app/dist/wsu-hw-ng /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
