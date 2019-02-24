CREATE USER 'replication'@'%' IDENTIFIED BY 'replicationpassword';
GRANT REPLICATION SLAVE ON *.* TO 'replication'@'%';
GRANT ALL ON *.* TO 'test'@'%';
FLUSH PRIVILEGES;
