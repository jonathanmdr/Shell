#!/bin/bash

CONTAINER_NAME="multillidae"
CONTAINER_ID=$(docker ps -a -q -f name=$CONTAINER_NAME)

if [[ -n "$CONTAINER_ID" ]]; then
  docker stop $CONTAINER_NAME
  docker rm $CONTAINER_NAME
fi

docker run --name $CONTAINER_NAME \
 -e MYSQL_ROOT_PASSWORD=masterkey \
 -e MYSQL_DATABASE=$CONTAINER_NAME \
 -e MYSQL_USER=$CONTAINER_NAME \
 -e MYSQL_PASSWORD=$CONTAINER_NAME \
 -v "$PWD/${CONTAINER_NAME}.sql":/docker-entrypoint-initdb.d/dump.sql \
 -p 3306:3306 \
 -d mysql --character-set-server=utf8 --collation-server=utf8_unicode_ci