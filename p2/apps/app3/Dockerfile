# Use a lightweight Python image
FROM python:3.9-alpine

# Set the working directory
WORKDIR /app

# Copy the Python server script into the container
COPY app.py /app/

# Expose port 80
EXPOSE 80

# Run the Python server
CMD ["python", "/app/app.py"]
