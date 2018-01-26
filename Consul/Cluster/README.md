# CONSUL cluster

  - official configuration parameters
```
https://www.consul.io/docs/agent/options.html
```

  - official architecture cl
  - agent server recommended per cluster : 3 -> 5
  - 1 agent client per host only

```
https://www.consul.io/docs/internals/architecture.html
```

```
https://www.digitalocean.com/community/tutorials/how-to-configure-consul-in-a-production-environment-on-ubuntu-14-04
```

### configuration containers 

  - containers with mode 'server' build a Quorum
  - Quorum = gossip messaging
  - when a leader is down a new election is launched

  - client mode is a bridge for registration and monitor from outside
  - visibility/security depends on bind address 
  - port 8500 (default)



```
server1.example.com 	192.0.2.1 	bootstrap consul server
server2.example.com 	192.0.2.2 	consul server
server3.example.com 	192.0.2.3 	consul server
agent1.example.com 	  192.0.2.50 	consul client
```

### mode bootstrap

 - only ONE bootstrap is allowed


### mode server

  - to build a quorum we MUST specify the size of the Quorum
  - otherwise elections are not possible


  - run "-join/-retry-join=<ip_address>"
  if multiple ips repeat "join" or use with array "-start-join=[<ip_address>]"

  - create a key for all containers "-encrypt=<key>"
  ```
  consul keygen
  X4SYOinf2pTAcAHRhpj7dA==
  ```
### mode client : for registration run on each host/ application
    - add "-client"
    - add "-ui" for web ui enabled
    - gossip with server via port 8300/tcp
    - gossip between client


### CLI to know
  - `docker exec -it <docker_name> consul members`
  - `dig @127.0.0.1 -p 8600 <natsA-4222>.service.consul ANY` or SRV to see port
  - ex: `redis.service.us-east-1.consul`
  <service_name>.service.<datacenter>.consul

  - curl http://127.0.0.1:8500/v1/catalog/service/natsa-6222

### apps:
  - apps register 
      environment:
        - SERVICE_NAME=applicationclientA
        - SERVICE_TAGS=applicationclientA