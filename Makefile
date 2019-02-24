clean:
	@./clean.sh

prepare:
	@./prepare.sh

master:
	@./master.sh

master_logs:
	@docker logs -f master-db

slave:
	@./slave.sh

slave_logs:
	@docker logs -f slave-db

slave_status:
	@./slave_status.sh

create_table:
	@./create_table.sh

insert_data:
	@./insert_data.sh

replication_success:
	@./replication_success.sh

docker_stats:
	@docker stats $(docker ps --format={{.Names}})
