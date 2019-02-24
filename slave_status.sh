#!/usr/bin/env bash

source ./_parameters.sh

echo "SHOW SLAVE STATUS\G
" | docker exec -i ${SLAVE_DB_CONTAINER_NAME} mysql -u${MYSQL_USER} -p${MYSQL_PASSWORD}
