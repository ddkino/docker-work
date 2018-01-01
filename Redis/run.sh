#!/bin/sh
echo "run with custom conf on the fly "
echo "detach mode & recreate new one "

REDIS_CONF_LOCAL=/home/dd/Docker/Redis/redis.conf
REDIS_CONF_DIST=/usr/local/etc/redis/redis.conf
VOL_DATA=/home/dd/Docker/Redis/data
PORT_LISTEN=63790
PORT_EXPOSE=6379

docker ps -a | grep -i "onthefly" | awk '{print $1}' | xargs docker rm

docker run -d --rm \
-p $PORT_LISTEN:$PORT_EXPOSE \
-v $REDIS_CONF_LOCAL:$REDIS_CONF_DIST \
-v $VOL_DATA:/data \
--name myredis-onthefly \
redis:4.0.6-alpine \
#-it --entrypoint /usr/bin/redis-server $REDIS_CONF_DIST 
# docker exec -it myredis-onthefly redis-server $REDIS_CONF_DIST 

# check
docker ps | grep redis


