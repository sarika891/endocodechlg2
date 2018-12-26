# import config.
# You can change the default config with `make cnf="config_special.env" build`
cnf ?= config.env
include $(cnf)
export $(shell sed 's/=.*//' $(cnf))

# grep the git hash of project
VERSION=$(shell ./version.sh)
#VERSION=09284756

#cleanup the docker container.Stop and remove the container
cleanup=$(shell ./dockerclean.sh $(APP_NAME))

.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help


# DOCKER TASKS
# Build the container
build: ## Build the container
	docker build -t $(APP_NAME) .

run: ## Run container on port configured in `config.env`
	docker run -d -i -t --rm --env-file=./config.env -p=$(PORT):$(PORT) --name="$(APP_NAME)" $(APP_NAME) python /chlng2/endocode.py $(VERSION) &


up: clean build run ## Run container on port configured in `config.env` (Alias to run)

stop: ## Stop and remove a running container
	docker stop $(APP_NAME); docker rm $(APP_NAME)

version: ## Output the current git hash of the project
	@echo $(VERSION)

clean: ## Output the current git hash of the project
	 @echo $(cleanup)
