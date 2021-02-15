#!/bin/bash

HOME_DIR="/home/jonathan.medeiros"
CONTAINER_NAME="multillidae"

cd $HOME_DIR

if [ ! -d backup ]; then
    mkdir backup
fi

docker exec -i $CONTAINER_NAME mysqldump --default-character-set=utf8 -u$CONTAINER_NAME -p$CONTAINER_NAME $CONTAINER_NAME > backup/"${CONTAINER_NAME}.sql"