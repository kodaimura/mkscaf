.PHONY: up build down stop in log ps reup help

up:
	docker compose up -d

build:
	docker compose build --no-cache

down:
	docker compose down

stop:
	docker compose stop

in:
	docker compose exec app bash

log:
	docker compose logs -f

ps:
	docker compose ps

reup: down up

help:
	@echo "Usage: make [target] [ENV=dev|prod]"
	@echo ""
	@echo "Targets:"
	@echo "  up        Start containers in the specified environment (default: dev)"
	@echo "  build     Build containers without cache"
	@echo "  down      Stop and remove containers, networks, and volumes"
	@echo "  stop      Stop containers"
	@echo "  in        Access app container via bash"
	@echo "  log       Show logs for containers"
	@echo "  ps        Show status for containers"
	@echo "  reup      Re-up containers"