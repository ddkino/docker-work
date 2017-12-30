#! /bin/sh
docker rmi -f cassandra-build
docker build -t cassandra-build .
docker images