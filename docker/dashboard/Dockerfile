# Base image
FROM python:3.12-slim

# Set the working directory
WORKDIR /app

# Copy the application code into the container
COPY . /app

# Install Flask and Gunicorn (Gunicorn still needs to be installed)
RUN pip install Flask gunicorn

# Expose the port that the Flask app will run on
EXPOSE 5000