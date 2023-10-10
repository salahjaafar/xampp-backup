# xampp-backup
---

**Shell Script for MySQL Database Backup and Compression**

This shell script is designed to automate the process of backing up MySQL databases and compressing the backup files. It can be scheduled to run periodically, ensuring that your database backups are both up-to-date and efficiently stored.

**Features:**

1. **Date and Time Stamping:** The script begins by capturing the current date and time, which is used to timestamp the generated backup files.

2. **Database Backup:** It supports multiple databases specified in the `databases` variable. For each database, it uses `mysqldump` to create a SQL dump file in the designated backup directory with the timestamped filename.

3. **Backup Cleanup:** Old backup files are pruned based on the specified criteria. In this script, backup files older than 120 days are deleted from the backup directory.

4. **Backup Compression:** All SQL backup files are then compressed into a single `.tar.gz` archive. This reduces storage space requirements and keeps your backups organized.

5. **Customization:** You can easily customize the script by modifying variables like `sql_directory`, `output_file`, and `databases` to match your specific environment and requirements.

6. **Scheduled Execution:** The script includes a `crontab` scheduling command, allowing you to schedule it to run at specific intervals. In the provided example, the script is scheduled to run every 23 hours, but you can adjust the schedule according to your needs.

**Usage:**

1. Save the script to a file, e.g., `backup.sh`.
2. Make the script executable with `chmod +x backup.sh`.
3. Customize the script by adjusting variables as needed.
4. Schedule the script using `crontab -e` and add the scheduling line provided in the script to automate its execution.

By utilizing this script, you can maintain efficient and up-to-date backups of your MySQL databases, making it easier to recover data in the event of data loss or system failures.

---

Feel free to customize this description further based on your preferences and any additional details you want to provide about your script.
