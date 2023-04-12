# xampp-backup
backup database xampp linux
Here's a brief explanation of the changes made to the script:
 - The script now defines a list of databases to backup and rewrite, which can be easily extended or modified.
 - Inside the loop, the script generates a unique backup file name for each database using the database name and the timestamp.
 - After creating the backup file, the script compresses it using gzip.
 - The script then rewinds the database from the backup by using the zcat command to uncompress the file and pipe it to the mysql command to execute the SQL commands in the backup file.
 - Finally, the script removes any backup files older than 7 days using the find command.
You can save this script to a file (e.g. backup.sh), make it executable (chmod +x backup.sh), and run it (./backup.sh) to backup and rewrite multiple databases. You can also schedule this script to run automatically using a cron job to create regular backups for your databases.
