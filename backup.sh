#!/bin/bash
#Powered by www.techno.rn.tn
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

# Schedule the script to run every 23 hours
crontab -l | { cat; echo "0 23 * * * /home/salah/backup.sh"; } | crontab -

#!/bin/bash

# Define the directory where your SQL files are located
sql_directory="/opt/lampp/htdocs/backup/"

# Define the name of the tar.gz file
output_file="/opt/lampp/htdocs/backup/all_sql_files-$DATE.tar.gz"

# Change to the SQL directory
cd "$sql_directory"

# Compress all SQL files into one tar.gz file
tar czvf "$output_file" *.sql

# Remove the original SQL files
rm -f *.sql

# Display a message indicating the process is complete
echo "SQL files compressed and removed successfully."
