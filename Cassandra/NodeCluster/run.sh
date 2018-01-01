#!/bin/sh
# --link cassandra-tuto  \
# Public port Port number. 	Description
# 22 	SSH port
# Cassandra inter-node ports Port number. 	Description
# 7000 	Cassandra inter-node cluster communication.
# 7001 	Cassandra SSL inter-node cluster communication.
# 7199 	Cassandra JMX monitoring port.
# Cassandra client ports Port number. 	Description
# 9042 	Cassandra client port.
# 9160 	Cassandra client port (Thrift).
# 9142 	Default for native_transport_port_ssl, useful when both encrypted and unencrypted connections are required 
docker rm -f cassandra-nodecluster
docker run -d --name cassandra-nodecluster \
-p 127.0.0.1:9043:9042 -p 127.0.0.1:9161:9160  \
-e CASSANDRA_SEEDS="$(docker inspect --format='{{ .NetworkSettings.IPAddress }}' cassandra-tuto)" \
-d cassandra:tuto
docker ps | grep cassandra


