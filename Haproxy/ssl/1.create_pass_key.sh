#!/bin/sh

## https://medium.com/@cramirez92/build-a-nodejs-cinema-microservice-and-deploying-it-with-docker-part-2-e05cc7b126e0

# Let's generate the server pass key
openssl genrsa -des3 -passout pass:x -out server.pass.key 2048

# now generate the server key from the pass key
openssl rsa -passin pass:x -in server.pass.key -out server.key

# remove pass key
rm -f server.pass.key