# Define variables
DOCKER_COMPOSE = docker-compose

# Build Docker image
build:
	$(DOCKER_COMPOSE) -f ./src/docker-compose.yml build
	$(DOCKER_COMPOSE) -f ./src/docker-compose.yml  up
	

NAME:
	${build}

# Run Docker container using Docker Compose
up:  
	$(DOCKER_COMPOSE) -./src/docker-compose.yml  up

# Stop Docker container using Docker Compose
down:
	$(DOCKER_COMPOSE) -f ./src/docker-compose.yml down

# Remove Docker container and image
clean:
	$(DOCKER_COMPOSE) -f ./src/docker-compose.yml  down --volumes --remove-orphans
	docker-compose rm -f

# Default target
default: build

