#!/bin/sh
cd /home/dd/install/apache-cassandra-3.11.1/bin/
./cqlsh

docker exec -i -t cassandra-tuto sh -c 'nodetool status'



docker exec -it cassandra-nodecluster bash

docker run -it --link cassandra-nodecluster \
--rm cassandra \
sh -c 'exec cqlsh "$CASSANDRA_PORT_9042_TCP_ADDR"'