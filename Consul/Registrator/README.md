# REGISTRATOR : replace client mode of official Consul

```
https://gliderlabs.com/registrator/latest/user/run/
```


### advantages :

  - auto registration and unregistration 


### config :

  - run Registrator on evrey host

  - help but mandatory : give access to network host 
   can connect to every container with port exposed even of on different network
  `--net=host`

  - access events from docker
  `--volume=/var/run/docker.sock:/tmp/docker.sock \`

  - path to : 
  `consul://localhost:8500`