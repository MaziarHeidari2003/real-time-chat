FROM python:3.10-slim

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    DONTWRITEBYTECODE=1

# Set the working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code and entrypoint script
COPY . /app/
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Expose the application port
EXPOSE 8000

# Set the entrypoint to the script
ENTRYPOINT ["/app/entrypoint.sh"]

# Default command to run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
