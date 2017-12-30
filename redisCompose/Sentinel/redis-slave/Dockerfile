FROM redis:4.0.6-alpine

COPY ./redis.2.conf /usr/local/etc/redis/
VOLUME [ /home/dd/Docker/Redis/data2, "/data"]
CMD [ "redis-server", "/usr/local/etc/redis/redis.2.conf" ]

