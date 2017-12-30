#!/bin/sh
echo "image from dockerfile with config file"

docker rm -f myredis-alpine-slave

PORT_LISTEN=63792
PORT_EXPOSE=6379

docker run \
--network net-redis \
-p $PORT_LISTEN:$PORT_EXPOSE \
--name myredis-alpine-slave \
-d myredis-slave
# check
docker ps | grep redis

