#!/usr/bin/env bash

source ./_parameters.sh

docker run --name=${MASTER_DB_CONTAINER_NAME} \
--restart always \
--env MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} \
--env MYSQL_DATABASE=${MYSQL_DATABASE} \
--env MYSQL_USER=${MYSQL_USER} \
--env MYSQL_PASSWORD=${MYSQL_PASSWORD} \
--volume ${MOUNT_ROOT}/${MASTER_DB_CONTAINER_NAME}/conf:/etc/mysql/conf.d \
--volume ${MOUNT_ROOT}/${MASTER_DB_CONTAINER_NAME}/data:/var/lib/mysql \
--volume ${MOUNT_ROOT}/${MASTER_DB_CONTAINER_NAME}/init:/docker-entrypoint-initdb.d \
--publish ${MASTER_DB_PORT}:3306 \
--net custom-network \
--detach mysql:5.7.25
