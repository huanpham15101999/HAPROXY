#!/bin/bash

# Create backup directory if it does not exist
mkdir -p /home/vnpt/backup

# declare variable
BACKUP_DIR="/home/vnpt/backup"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Delete backups older than 15 days
find "$BACKUP_DIR" -type f -name "*.zip" -mtime +15 -exec rm {} \;

# create zip file
ZIP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.zip"
zip -r "$ZIP_FILE" notification-server svc-file

# Send zip file to backup server
scp "$ZIP_FILE" vnpt@10.20.251.100:/home/vnpt/backup
