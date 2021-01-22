#!/bin/bash

# Create Network
docker network create swarm --subnet=172.18.0.0/16

# Create shared volume
docker volume create shared-volume

# Run Redis DB
# docker run --name dp-redis -p 6379:6379 -d redis

# Run RabbitMQ
docker run -it --name dp-jobqueue --net swarm --ip 172.18.0.2 -p 15672:15672 -p 5672:5672 rabbitmq:3-management
