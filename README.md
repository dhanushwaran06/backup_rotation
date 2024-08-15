# Log Backup and Rotation Script

## Overview
This shell script automates the process of backing up and rotating log files on a Linux system. It compresses the logs into a `.tar.gz` archive and manages the number of backups by deleting the oldest ones when the maximum limit is reached. The script logs all actions, ensuring that you have a record of backups and rotations.

## Features
- **Automated Log Backups**: The script automatically compresses and archives log files from the specified directory.
- **Backup Rotation**: It keeps your backup directory organized by automatically deleting the oldest backup when a specified limit is reached.
- **Customizable**: You can easily configure the directories and the number of backups to retain.
- **Logging**: All operations are logged, providing a clear audit trail of backup activities.

## Usage Instructions
1. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/log-backup-rotation-script.git
