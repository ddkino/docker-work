#!/bin/sh

docker build -t my-haproxy:1.8-alpine .
docker rm -f my-haproxy
docker run --name my-haproxy -d my-haproxy:1.8-alpine
sleep 1s
docker ps -a
