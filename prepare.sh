#!/usr/bin/env bash

source ./_parameters.sh

# Create folders
for p in ${MOUNT_PATHS[*]}; do
    mkdir -p ${MOUNT_ROOT}/master-db/${p}
    mkdir -p ${MOUNT_ROOT}/slave-db/${p}
done

# Set permissions
for p in ${MOUNT_PATHS[*]}; do
    chown -R polkitd:ssh_keys ${MOUNT_ROOT}/master-db/${p}
    chown -R polkitd:ssh_keys ${MOUNT_ROOT}/slave-db/${p}
    chmod -Rf 0755 ${MOUNT_ROOT}/master-db/${p}
    chmod -Rf 0755 ${MOUNT_ROOT}/slave-db/${p}
done
