#! /bin/sh
docker rmi -f myredis-slave
docker build -t myredis-slave .
docker images