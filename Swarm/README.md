### LEAVE FIRST

`docker swarm leave --force`

### INIT

`docker swarm init --advertise-addr 127.0.0.1`

- result message 'To add a worker to this swarm':
docker swarm join --token SWMTKN-1-3hykrwju4j7nx67trdgtezuo2u1zgpsr4emhx6ite60ftw0f43-0yv04baq1ps1dq9igv4efa3o0 127.0.0.1:2377

### MANAGE 
`docker node ls`

- more info : `docker inspect pbexkrk1rtd1pu1dxjprfomvb7`


### CREATE A SERVICE

  - a service is a container which is able to run on ANY nodes of 
  the swarm 

  - `docker service create --name helloworld --replicas 2 --publish 8880:8880 helloworld:latest`

  - `docker service ls`

  - change options -> replicas :
  `docker service update <name or ID> --replicas 3`

  - check running :
  `docker service ps <name>`


  - connecting : can connect to the container via ANY host of the swarm,
  docker swarm re-route seemless the request to the container 

### SERVICE MODE GLOBAL

  - in global mode : docker create an instance of container on each node swarm
  
  - replace replicas by `--mode global`
  `docker service create --name helloworld --mode global --publish 8880:8880 helloworld:latest`