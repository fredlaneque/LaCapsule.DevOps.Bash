#!/bin/bash

# Define Directories and Backup name
SEARCH_DIR="/home/engineer/Documents"
ARCHIVE_DIR="/home/engineer/backup"
ARCHIVE_NAME="backup-$(date +%Y%m%d).tar.gz"

# Find all files modified during last 7 days and add them to the archive
find "$SEARCH_DIR" -type f -mtime -7 | tar -czvf "$ARCHIVE_DIR/$ARCHIVE_NAME" -T -
