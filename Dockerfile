# Using an official Python runtime as the parent image
FROM python:3.11-slim-bullseye

# Set environment variables for Python to run unbuffered
ENV PYTHONUNBUFFERED 1

# Install any needed packages specified in requirements.txt
COPY requirements.txt /app/
WORKDIR /app
RUN apt-get update && apt-get install -y \
    gcc \
    libc-dev \
    libssl-dev \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . /app/

# Define environment variable for Prometheus Pushgateway
ENV PROMETHEUS_PUSHGATEWAY_ADDRESS ""

CMD ["python", "main.py"]
