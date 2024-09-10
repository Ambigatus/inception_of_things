# Use a lightweight Python image
FROM python:3.9-alpine

# Set the working directory
WORKDIR /app

# Create the ASCII art directory and files
RUN mkdir /ascii-art
COPY hello.txt /ascii-art/
COPY welcome.txt /ascii-art/
COPY rocks.txt /ascii-art/

# Copy the Python server script into the container
COPY app.py /app/

# Expose port 80
EXPOSE 80

# Run the Python server
CMD ["python", "/app/app.py"]
