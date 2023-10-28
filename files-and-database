#!/bin/bash
# Powered by www.techno.rn.tn
# Get the current date and time
DATE=$(date +%Y-%m-%d-%H-%M)

# Dump all the databases to the backup directory
# List of databases separated by space
databases="database1 database2 database3"

# Loop through each database and create a backup
for database in $databases; do
 /opt/lampp/bin/mysqldump --user=root --password="password" "$database" > "/opt/lampp/htdocs/backup/$database-$DATE.sql"
done

# Remove old backup files
find /opt/lampp/htdocs/backup/ -type f -mtime +120 -delete

# Define the directory where your SQL files are located
sql_directory="/opt/lampp/htdocs/backup/"

# Define the name of the tar.gz file for SQL backups
sql_output_file="/opt/lampp/htdocs/backup/all_sql_files-$DATE.tar.gz"

# Change to the SQL directory
cd "$sql_directory"

# Compress all SQL files into one tar.gz file
tar czvf "$sql_output_file" *.sql

# Remove the original SQL files
rm -f *.sql

# Define the source directory for file and directory backups
source_directory="/opt/lampp/htdocs/"

# Define the name of the tar.gz file for file and directory backups
file_output_file="/opt/lampp/htdocs/backup/all_files_and_dirs-$DATE.tar.gz"

# Compress all files and directories in the source directory
tar czvf "$file_output_file" -C "$source_directory" .

# Copy the file and directory backup to /media/veracrypt1/backup
cp "$file_output_file" /media/veracrypt1/backup/

# Display a message indicating the process is complete
echo "File and directory backups compressed and copied successfully."

# Schedule the script to run every 23 hours
crontab -l | { cat; echo "0 23 * * * /home/salah/backup.sh"; } | crontab -
