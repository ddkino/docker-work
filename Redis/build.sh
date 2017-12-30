#! /bin/sh
docker rmi -f myredis-master
docker build -t myredis-master .
docker images