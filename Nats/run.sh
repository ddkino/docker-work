#!/bin/sh
docker run  -p 4222:4222 -p 6222:6222 --name nats-main -d  nats:latest