#!/bin/bash

# Log rotation and backup script (My First advanced script)
# Author: Dhanushwaran
# Date: 14 August 2024

# Variables
LOG_DIR="/var/log"
BACKUP_DIR="/backup/logs"
DATE=$(date +"%Y%m%d")
MAX_BACKUPS=7
LOG_FILE="/var/log/backup_log_rotation.log"

# Functions
log_message() {
    echo "$(date +"%Y-%m-%d %H:%M:%S") - $1" | tee -a $LOG_FILE
}

create_backup() {
    log_message "Starting backup for $LOG_DIR"
    tar -czf "$BACKUP_DIR/logs_$DATE.tar.gz" -C "$LOG_DIR" .
    if [ $? -eq 0 ]; then
        log_message "Backup successful: logs_$DATE.tar.gz"
    else
        log_message "Backup failed!"
        exit 1
    fi
}

rotate_backups() {
    log_message "Rotating old backups"
    BACKUPS=$(ls -1tr $BACKUP_DIR | grep logs_ | wc -l)
    if [ $BACKUPS -gt $MAX_BACKUPS ]; then
        OLD_BACKUP=$(ls -1tr $BACKUP_DIR | grep logs_ | head -n 1)
        rm -f "$BACKUP_DIR/$OLD_BACKUP"
        if [ $? -eq 0 ]; then
            log_message "Old backup removed: $OLD_BACKUP"
        else
            log_message "Failed to remove old backup: $OLD_BACKUP"
        fi
    fi
}

# Main Script
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
    log_message "Created backup directory: $BACKUP_DIR"
fi

create_backup
rotate_backups

log_message "Backup and rotation completed"

# End of script
