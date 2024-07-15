# Define variables
DOCKER_COMPOSE = docker-compose

# Build Docker image
build:
	$(DOCKER_COMPOSE) build
	$(DOCKER_COMPOSE) up
	

NAME:
	${build}

# Run Docker container using Docker Compose
up:  
	$(DOCKER_COMPOSE) up

# Stop Docker container using Docker Compose
down:
	$(DOCKER_COMPOSE) down

# Remove Docker container and image
clean:
	$(DOCKER_COMPOSE) down --volumes --remove-orphans
	docker-compose rm -f

# Default target
default: build

