#!/bin/sh
echo "run with custom conf on the fly "
echo "detach mode & recreate new one "

PORT_LISTEN=63790
PORT_EXPOSE=6379

docker run --name cassandra-bare3 -d cassandra:3.11 
docker ps | grep cassandra


