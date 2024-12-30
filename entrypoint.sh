#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status.

echo "Applying database migrations..."
python manage.py makemigrations
python manage.py migrate

echo "Starting the server..."
exec "$@"
