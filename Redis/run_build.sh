#!/bin/sh
echo "image from dockerfile with config file"
echo "create network for connections"
docker network create --driver bridge net-redis
echo "clean old container"
docker rm -f myredis-alpine

PORT_LISTEN=63791
PORT_EXPOSE=6379

docker run \
--network net-redis \
-p $PORT_LISTEN:$PORT_EXPOSE \
--name myredis-alpine \
-d myredis-master
# check
docker ps | grep redis

