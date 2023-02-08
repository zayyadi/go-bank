postgres:
	docker run --name postgresGO -p 5433:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=zayyad -d postgres:latest

createdb:
	docker exec -it postgresGO createdb --username=postgres --owner=postgres simple_bank

dropdb:
	docker exec -it postgresGO dropdb --username=postgres --owner=postgres simple_bank

migrate-up:
	migrate -path db/migration -database "postgres://postgres:zayyad@localhost:5433/simple_bank?sslmode=disable" --verbose up
migrate-down:
	migrate -path db/migration -database "postgres://postgres:zayyad@localhost:5433/simple_bank?sslmode=disable" --verbose down

.PHONY: postgres createdb dropdb migrate 