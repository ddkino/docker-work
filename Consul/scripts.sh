docker run \
  -d \
  -e CONSUL_CLIENT_INTERFACE='eth0' \
  -e CONSUL_BIND_INTERFACE='eth0' \
  --name consul-dev \
  consul:1.0.2 agent -server -bootstrap-expect=3


# developement mode ok 
docker run -d --name=dev-consul -e CONSUL_BIND_INTERFACE=eth0 consul
docker run -d -e CONSUL_BIND_INTERFACE=eth0 consul:1.0.2 agent -dev -join=172.17.0.2
docker run -d -e CONSUL_BIND_INTERFACE=eth0 consul:1.0.2 agent -dev -join=172.17.0.2
docker exec -t <container> consul members