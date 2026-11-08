# Use a Python base image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Install necessary dependencies including git and perl
RUN apt-get update && \
    apt-get install -y git perl && \
    rm -rf /var/lib/apt/lists/*

# Copy the contents of the project to the /app directory
COPY . /app

# Ensure the shell scripts are executable
RUN chmod +x /app/.github/scripts/entrypoint.sh
RUN chmod +x /app/.github/scripts/update_index.sh

# Set the entrypoint
ENTRYPOINT ["/bin/bash", "/app/.github/scripts/entrypoint.sh"]