#!/bin/bash

# Database configuration
DB_HOST=localhost
DB_USER=root
DB_PASS=password

# Backup directory
BACKUP_DIR=/path/to/backup

# Current date and time
DATE=$(date +%Y-%m-%d_%H-%M-%S)

# Backup file name
BACKUP_FILE=${BACKUP_DIR}/backup_${DATE}.sql.gz

# Loop through all databases
for DB_NAME in $(mysqlshow -h ${DB_HOST} -u ${DB_USER} -p${DB_PASS} | awk '{print $2}' | grep -v '^Database$')
do
    # Backup each database to a file
    /opt/lampp/bin/mysqldump -h ${DB_HOST} -u ${DB_USER} -p${DB_PASS} ${DB_NAME} | gzip > ${BACKUP_DIR}/${DB_NAME}.sql.gz
done

# Compress all backup files into a single gzip file
gzip -c ${BACKUP_DIR}/*.sql.gz > ${BACKUP_FILE}

# Remove the individual backup files older than 7 days
find ${BACKUP_DIR} -name "*.sql.gz" -type f -mtime +7 -exec rm {} \;

echo "Backup saved to ${BACKUP_FILE}"
