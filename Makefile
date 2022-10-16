default: run
service:=ms-web-hello

.PHONY: run
start: 
	docker compose up

.PHONY: stop
stop: 
	docker compose down

.PHONY: restart
restart: stop start

.PHONY: logs
logs: 
	docker compose logs -f ${service}

.PHONY: ps
ps: 
	docker compose ps

.PHONY: shell
shell: 
	docker compose exec ${service} sh

.PHONY: build
build:
	docker compose build --no-cache	
