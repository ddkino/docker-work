#!/bin/sh
dk-m create \
--engine-env 'DOCKER_OPTS="-H unix:///var/run/docker.sock"'
--driver virtualbox \
vm1

dk-m create \
--engine-env 'DOCKER_OPTS="-H unix:///var/run/docker.sock"'
--driver virtualbox \
vm2

dk-m create \
--engine-env 'DOCKER_OPTS="-H unix:///var/run/docker.sock"'
--driver virtualbox \
vm3

ip = $(dm ip vm1)
eval "$(dk-m env vm1)"

dk-sw init \
--listen-addr $ip1 \
--advertise-addr $ip1

#----------------------------
echo "join swarm"
# worker = generic like manager
token=$(dk-sw join-token worker -q)

eval "$(dk-m env vm2)"

dk-sw join \
--token $token \
$ip1:2377

eval "$(dk-m env vm)"

dk-sw join \
--token $token \
$ip1:2377

#--------------------------
echo "create network"
eval "$(docker-machine env vm1)"

docker network create \
    -d overlay --subnet 10.1.9.0/24 \
    multi-host-net

#--------------------------
echo "create UI for cluster"

docker service create \
  --name=viz \
  --publish=5050:8080/tcp \
  --constraint=node.role==manager \
  --mount=type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
  manomarks/visualizer