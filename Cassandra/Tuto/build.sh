#! /bin/sh
docker rmi -f cassandra:tuto
docker build -t cassandra:tuto .
docker images