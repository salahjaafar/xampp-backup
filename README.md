# xampp-backup
backup database xampp linux
Here's a brief explanation of the changes made to the script:
 - The script now defines a list of databases to backup and rewrite, which can be easily extended or modified.
 - Inside the loop, the script generates a unique backup file name for each database using the database name and the timestamp.
 - After creating the backup file, the script compresses it using gzip.
 - The script then rewinds the database from the backup by using the zcat command to uncompress the file and pipe it to the mysql command to execute the SQL commands in the backup file.
 - Finally, the script removes any backup files older than 7 days using the find command.
You can save this script to a file (e.g. backup.sh), make it executable (chmod +x backup.sh), and run it (./backup.sh) to backup and rewrite multiple databases. You can also schedule this script to run automatically using a cron job to create regular backups for your databases.

##Automatic backup on Ubuntu system and linux mint

If you want to view the cron jobs that are scheduled on your Ubuntu system, you can use the `crontab` command to display the contents of the cron table. Here's how to do it:

1. Open a terminal window on your Ubuntu system.

2. Type <sup>`crontab -l`</sup> and press Enter to view the current user's cron table.

3. If you want to view the cron table for a specific user, type <sup>`crontab -u username -l`</sup> and press Enter, replacing <sup>`username`</sup> with the name of the user whose cron table you want to view.

The <sup>`crontab -l`</sup> command will display the contents of the user's cron table in the terminal window. The output will show the schedule and command for each cron job that is currently scheduled.

If you want to modify the cron table, you can use the `crontab -e` command to edit the table using your default text editor. This will open the cron table in the editor, where you can add, modify, or delete cron jobs as needed. Once you have made your changes and saved the file, the new cron table will take effect immediately.

I hope this helps! Let me know if you have any further questions.
