## Installation

#post installation 

https://docs.docker.com/engine/installation/linux/linux-postinstall/

#create a group & logout 
sudo groupadd docker

sudo usermod -aG docker $USER

# fix .docker permission
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "/home/$USER/.docker" -R


## Dockerfile

# http://goinbigdata.com/

Explain Dockerfile and best partices with good exercises

- RUN vs CMD : RUN add layer to image to create new image 
CMD execute intrucstion after on the image

- `ADD VS COPY` $from $to: copy  files from LOCAL 2 CONTAINER
COPY local files, ADD can be url

- ENTRYPOINT :
ENTRYPOINT has two forms:
    ENTRYPOINT ["executable", "param1", "param2"] (exec form, preferred)
    ENTRYPOINT command param1 param2 (shell form)
no PID : so good for no sensible commands
otherwise use CMD

- WORKDIR : application directory or main dir

COPY package*.json ./

- ENV env_name env_value : variable for script inner entry point or 
original image

- ARGS : use during build

## after build image 
sudo ll /var/lib/docker
sudo docker images 


##volume / mount
```
https://docs.docker.com/engine/admin/volumes/volumes/#choose-the--v-or-mount-flag

Originally, the -v or --volume flag was used for standalone containers and the --mount flag was used for swarm services. However, starting with Docker 17.06, you can also use --mount with standalone containers. In general, --mount is more explicit and verbose. The biggest difference is that the -v syntax combines all the options together in one field, while the --mount syntax separates them. Here is a comparison of the syntax for each flag.
```

###Compose

##depends_on / links
```
 depends_on will not wait for db and redis to be “ready” before starting web - only until they have been started. If you need to wait for a service to be ready, see Controlling startup order for more on this problem and strategies for solving it.
```

```
web:
  image: example/my_web_app:latest
  links:
    - db
    - cache

db:
  image: postgres:latest

cache:
  image: redis:latest

With links, code inside web will be able to access the database using db:5432, assuming port 5432 is exposed in the db image. If depends_on were used, this wouldn't be possible, but the startup order of the containers would be correct.
```