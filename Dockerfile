# Use Python 3.11 slim image as base
FROM python:3.11-slim

# Set working directory in container
WORKDIR /app

# Copy the Python script to the container
COPY hello_world.py .

# Set the script as executable
RUN chmod +x hello_world.py

# Create a non-root user for security
RUN groupadd -r appuser && useradd -r -g appuser appuser
RUN chown -R appuser:appuser /app
USER appuser

# Run the Python script when container starts
CMD ["python", "hello_world.py"] 