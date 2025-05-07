# Base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy requirements and install
COPY app/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY app/ .

# Expose port
EXPOSE 80

# Run the application
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:80", "main:app"]