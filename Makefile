default: run
service:=ms-web-hello

.PHONY: run
run: 
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

.PHONY: build-for-hub
build-for-hub:
	docker image build -t irakli/${service}:0.1 -t irakli/${service}:latest .
	docker image push irakli/${service}:0.1
	docker image push irakli/${service}:latest

.PHONY: kube-deploy
kube-deploy:
	kubectl apply -f kube-deployment.yml

.PHONY: kube-undeploy
kube-undeploy:
	kubectl deployment delete ${service}

.PHONY: kube-expose
kube-expose:
	kubectl expose deployment ${service} --port=80 --target-port=8181 --name=${service}-lb --type=LoadBalancer

.PHONY: kube-unexpose
kube-unexpose:
	kubectl service delete ${service}-lb
