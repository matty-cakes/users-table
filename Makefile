APP := app
PGPASSWORD := notachance123!
CREATE_USERS_TABLE := "psql -U admin -d ${APP}_db -a -f /usr/sql/create-users-table.sql"
INSERT_USER := "psql -U admin -d ${APP}_db -a -f /usr/sql/insert-into-users-table.sql"

.PHONY: setup
setup:
	@echo "Setting up...\n"
	mkdir -p "${HOME}/docker/volumes/postgres/${APP}_db"
	make start
	@echo "Waiting for a little while before attempting to connect to DB ⏲️\n"
	sleep 20
	make init-db
	@echo "Done setting up...\n"

.PHONY: start
start:
	@echo "Starting database...\n"
	docker network create ${APP}-net
	docker run --detach --rm \
		--name "${APP}-db" \
        --network ${APP}-net \
        --publish 5432:5432 \
        --env "POSTGRES_PASSWORD=${PGPASSWORD}" \
        --env "POSTGRES_USER=admin" \
        --env "POSTGRES_DB=${APP}_db" \
        -v "${HOME}/docker/volumes/postgres/${APP}_db:/var/lib/postgresql/data" \
        -v "${PWD}/sql:/usr/sql" \
        postgres

	@echo "Database running...\n"

.PHONY: init-db
init-db:
	@echo "Initializing database tables...\n"
	docker exec --env "PGPASSWORD=${PGPASSWORD}" ${APP}-db bash -c ${CREATE_USERS_TABLE}
	docker exec --env "PGPASSWORD=${PGPASSWORD}" ${APP}-db bash -c ${INSERT_USER}
	@echo "Database tables initialized...\n"

.PHONY: stop
stop:
	@echo "Stopping database..."
	docker rm -f "${APP}-db"
	docker network rm "${APP}-net"
	@echo "Database stopped..."

.PHONY: clean
clean:
	@echo "Cleaning environment..."
	make stop
	rm -rf "${HOME}/docker/volumes/postgres/${APP}_db"
	@echo "Done cleaning environment..."
