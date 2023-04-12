#!/bin/bash

# Database configuration (techno.rn.tn)
DB_HOST=localhost
DB_USER=root
DB_PASS=password

# List of databases to backup and rewrite
DATABASES=("database1" "database2" "database3")

# Backup directory
BACKUP_DIR=/path/to/backup/directory

# Date format for backup file name
DATE=$(date +%Y-%m-%d_%H-%M-%S)

for DB_NAME in "${DATABASES[@]}"
do
  # Backup file name
  BACKUP_FILE=${BACKUP_DIR}/${DB_NAME}_${DATE}.sql

  # Create backup directory if it doesn't exist
  mkdir -p ${BACKUP_DIR}

  # Backup database
  mysqldump -h ${DB_HOST} -u ${DB_USER} -p${DB_PASS} ${DB_NAME} > ${BACKUP_FILE}

  # Compress backup file
  gzip ${BACKUP_FILE}

  # Rewrite database from backup
  zcat ${BACKUP_FILE}.gz | mysql -h ${DB_HOST} -u ${DB_USER} -p${DB_PASS} ${DB_NAME}

  # Remove backups older than 7 days
  find ${BACKUP_DIR} -type f -name '*.gz' -mtime +7 -delete
done
