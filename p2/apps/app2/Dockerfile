# Use a lightweight Node.js image
FROM node:14-alpine

# Set the working directory
WORKDIR /app

# Copy the server script into the container
COPY app.js /app/

# Expose port 80
EXPOSE 80

# Run the Node.js server
CMD ["node", "/app/app.js"]
