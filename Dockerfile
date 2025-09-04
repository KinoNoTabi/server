# Use an LTS Node base
FROM node:20-alpine

# Create app directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm ci --production

# Copy source
COPY . .

# Ensure PORT is read from env (your app should use process.env.PORT)
ENV NODE_ENV=production

# Expose default port (change if your app uses a different default)
EXPOSE 3000

# Start the app
CMD ["node", "src/index.js"]
