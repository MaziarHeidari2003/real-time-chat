#!/bin/bash

# Get the current date in dd-mm-yy format
DIR=$(date +%d-%m-%y)

# Define backup directory
DEST=~/db_backup/$DIR

# Create backup directory
mkdir -p "$DEST"

# PostgreSQL credentials
PG_HOST='db'
PG_PORT='5432'
PG_USER='postgres'
PG_PASS='maziare11223344'
DB_NAME='rt_chat_database'

# Export password to avoid password prompt
export PGPASSWORD=$PG_PASS

# Run backup
pg_dump --insert --column-inserts --username=$PG_USER --host=$PG_HOST --port=$PG_PORT $DB_NAME > "$DEST/backup.sql"

# Unset password for security
unset PGPASSWORD

echo "Backup completed at $DEST/backup.sql"

