#! /bin/sh
docker run -p 4545:8080 -name "nodejs-example" -d dede/node-app-js:9.3.0-alpine
docker ps