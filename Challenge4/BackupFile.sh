#!/bin/bash

#Create a script that backs up all .txt files from one directory to another.

#Requirements:
#Prompt user for source directory
#Create a backup directory if it doesn't exist
#Copy all .txt files to the backup directory
#Add timestamp to backup directory name
#Display count of files backed up

# Prompt user for source directory
read -p "Enter the source directory: " SOURCE_DIR

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Source directory does not exist."
    exit 1
fi

# Create timestamp
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M")

# Create backup directory name
BACKUP_DIR="backup_$TIMESTAMP"

# Create backup directory
mkdir -p "$BACKUP_DIR"

# Initialize counter
COUNT=0

# Copy all .txt files
for FILE in "$SOURCE_DIR"/*.txt; do
    if [ -f "$FILE" ]; then
        cp "$FILE" "$BACKUP_DIR"
        ((COUNT++))
    fi
done

# Display count of files backed up
echo "Backup directory created :$BACKUP_DIR Copying.txt files."
echo "Backup complete ! File backed up: $COUNT "