#!/bin/bash

BACKUP_DIR="/home/jonathan.medeiros/backup"
BUCKET_NAME="shell-course"
CONTAINER_NAME="multillidae"

cd $BACKUP_DIR

actual_date=$(date +%F)

if [ ! -d $actual_date ]; then
    mkdir $actual_date
fi

docker exec -i $CONTAINER_NAME mysqldump --default-character-set=utf8 -u$CONTAINER_NAME -p$CONTAINER_NAME $CONTAINER_NAME > "${actual_date}/${CONTAINER_NAME}.sql"

aws s3 sync $BACKUP_DIR s3://$BUCKET_NAME