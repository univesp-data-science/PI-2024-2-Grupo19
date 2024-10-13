.PHONY: build start stop restart shell

IMAGE_NAME=docker-pi-2024-g19
PROJECT_NAME=volunteer-manager
PORT=80
container=$(docker ps -a -q --filter ancestor=${IMAGE_NAME} --format="{{.ID}}")

help: ## Print help.
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

build: ## Build image
	@docker build -t ${IMAGE_NAME} .

start: ## Start container
	@echo "Starting container at http://localhost:${PORT}..."
	@docker run -e PORT=${PORT} -p ${PORT}:${PORT} ${IMAGE_NAME}

stop: ## Stop container
	@echo "Stopping container..."
	@docker rm $(shell docker stop $(shell docker ps -a -q --filter ancestor=${IMAGE_NAME} --format="{{.ID}}"))

restart: stop start ## Restart container

shell: ## SSH into container
	@docker exec -it $(shell docker ps -a -q --filter ancestor=${IMAGE_NAME} --format="{{.ID}}") /bin/ash

local-start: ##Start laravel project using artisan
	php ./src/artisan serve

push-gcp:
	make build
	gcloud config set project ${PROJECT_NAME}
	docker tag ${IMAGE_NAME} gcr.io/${PROJECT_NAME}/${IMAGE_NAME}
	docker push gcr.io/${PROJECT_NAME}/${IMAGE_NAME}

##gcloud run services update custom-form-tool --image=gcr.io/bradesco-eventos/docker-custom-form-tool:latest --region=us-central1