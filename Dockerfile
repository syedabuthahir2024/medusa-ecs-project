# Use official Medusa base image
FROM node:18-slim

# Create app directory
WORKDIR /app

# Copy files
COPY . .

# Install dependencies
RUN npm install

# Build (optional if using TypeScript or frontend)
# RUN npm run build

# Expose port
EXPOSE 9000

# Set environment variables
ENV NODE_ENV=production

# Start Medusa server
CMD ["npx", "medusa", "develop"]
