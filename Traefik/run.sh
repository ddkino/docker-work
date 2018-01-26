#!/bin/sh
docker run -d -p 8080:8080 -p 80:80 \
--name tk \
-v /var/run/docker.sock:/var/run/docker.sock \
-v $PWD/traefik.toml:/etc/traefik/traefik.toml traefik