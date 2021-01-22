# stop redis container
docker stop dp-redis
# stop RabbitMQ container
docker stop dp-jobqueue

# remove dp-redis
docker rm dp-redis
# remove dp-jobqueue
docker rm dp-jobqueue

#remove network
docker network rm swarm

#remove volume
docker volume rm shared-volume
