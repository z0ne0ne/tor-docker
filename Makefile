.PHONY: help
help: ## this help
	@echo "Please use 'make <target>' where <target> is one of"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-32s\033[0m %s\n", $$1, $$2}'

start: ## start tor
	docker run -d --rm --name tor -p 9001:9001 -p 9030:9030 -p 9050:9050 -p 9051:9051 --volume ${PWD}:/etc/tor docker-tor

stop: ## stop tor
	docker stop tor

status: ## status of tor
	docker ps -a

shell: ## start a shell
	docker exec -it tor sh
