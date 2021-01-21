#!/bin/bash

# Run RabbitMQ
docker run -it --net swarm -ip 172.18.0.2 -p 15672:15672 -p 5672:5672 rabbitmq:3-management

# Run Redis DB
docker run --name dp-redis -p 6379:6379 -d redis

# Create Network
docker create network swarm

# Create shared volume
docker volume create shared-volume