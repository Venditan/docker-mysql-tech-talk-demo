#!/usr/bin/env bash

source ./_parameters.sh

# Create folders
for p in ${MOUNT_PATHS[*]}; do
    mkdir -p ${MOUNT_ROOT}/${MASTER_DB_CONTAINER_NAME}/${p}
    mkdir -p ${MOUNT_ROOT}/${SLAVE_DB_CONTAINER_NAME}/${p}
done

# Copy configuration files
cp $(pwd)/mysql-conf/master.cnf ${MOUNT_ROOT}/${MASTER_DB_CONTAINER_NAME}/conf/my.cnf
cp $(pwd)/mysql-conf/slave.cnf ${MOUNT_ROOT}/${SLAVE_DB_CONTAINER_NAME}/conf/my.cnf
cp $(pwd)/mysql-conf/master-init.sql ${MOUNT_ROOT}/${MASTER_DB_CONTAINER_NAME}/init/00_master_replication.sql
cp $(pwd)/mysql-conf/slave-init.sql ${MOUNT_ROOT}/${SLAVE_DB_CONTAINER_NAME}/init/00_slave_replication.sql

# Set permissions
for p in ${MOUNT_PATHS[*]}; do
    #chown -R polkitd:ssh_keys ${MOUNT_ROOT}/${MASTER_DB_CONTAINER_NAME}/${p}
    #chown -R polkitd:ssh_keys ${MOUNT_ROOT}/${SLAVE_DB_CONTAINER_NAME}/${p}
    chmod -R 0775 ${MOUNT_ROOT}/${MASTER_DB_CONTAINER_NAME}/${p}
    chmod -R 0775 ${MOUNT_ROOT}/${SLAVE_DB_CONTAINER_NAME}/${p}
done

# Create custom network
docker network create ${CUSTOM_NETWORK_NAME}
