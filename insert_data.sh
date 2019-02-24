#!/usr/bin/env bash

source ./_parameters.sh

echo "INSERT INTO ${MYSQL_TABLE_NAME}
SET test_value='My Replicated Test Value';
" | docker exec -i ${MASTER_DB_CONTAINER_NAME} mysql -u${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE}
