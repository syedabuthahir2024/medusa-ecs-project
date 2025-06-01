# FROM node:18-alpine

# WORKDIR /app

# COPY package*.json ./
# COPY . .

# RUN npm install

# EXPOSE 9000

# CMD ["npm", "start"]

FROM node:18

# Create app directory
WORKDIR /app

# Clone medusa and install
RUN git clone https://github.com/medusajs/medusa.git . \
    && npm install

# Expose default Medusa port
EXPOSE 9000

# Start Medusa server
CMD ["npm", "run", "start"]
