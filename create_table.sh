#!/usr/bin/env bash

source ./_parameters.sh

echo "CREATE TABLE ${MYSQL_TABLE_NAME}(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
test_value VARCHAR(80) NOT NULL DEFAULT '');
" | docker exec -i ${MASTER_DB_CONTAINER_NAME} mysql -u${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE}
