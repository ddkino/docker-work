#!/bin/sh

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
docker rm -f cassandra-tuto
docker run --name cassandra-tuto \
-m 2g \
-p 127.0.0.1:9042:9042 -p 127.0.0.1:9160:9160 \
-d cassandra:tuto 
docker ps | grep cassandra 



