#!/usr/bin/env bash

source ./_parameters.sh

# stop and delete containers
docker container stop ${MASTER_DB_CONTAINER_NAME} ${SLAVE_DB_CONTAINER_NAME} || true && \
docker container rm ${MASTER_DB_CONTAINER_NAME} ${SLAVE_DB_CONTAINER_NAME} || true

# delete custom network
docker network rm ${CUSTOM_NETWORK_NAME} || true

# empty mount directory
rm -rf ${MOUNT_ROOT}/*
