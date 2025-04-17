# Use the Node.js 18 Bullseye image
FROM node:18-bullseye

# Set working directory in the container
WORKDIR /app

# Copy package files to leverage Docker caching
COPY angular-site/package*.json ./

# Install dependencies
RUN npm install

# Copy the entire Angular app source code
COPY angular-site/ .

# Build the Angular app for production
RUN npm run build -- --configuration=production

# Install a lightweight static server globally
RUN npm install -g serve

# Expose the port the server will run on
EXPOSE 3000

# Command to serve the built Angular app
CMD ["serve", "-s", "dist", "-l", "3000"]