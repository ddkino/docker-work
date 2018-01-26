#!/bin/sh
    docker run -d \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -v $PWD/traefik.toml:/traefik.toml \
      -v $PWD/acme.json:/acme.json \
      -p 80:80 \
      -p 443:443 \
      -l traefik.frontend.rule=Host:monitor.example.com \
      -l traefik.port=8080 \
      --network proxy \
      --name tk-test \
      traefik:latest --docker
