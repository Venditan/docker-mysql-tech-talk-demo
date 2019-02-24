#!/usr/bin/env bash

source ./_parameters.sh

echo "SELECT * FROM ${MYSQL_TABLE_NAME}\G
" | docker exec -i ${SLAVE_DB_CONTAINER_NAME} mysql -u${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE}
