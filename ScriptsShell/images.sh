#!/bin/sh
docker images -a | grep "car" | awk '{print $3}'

echo "remove images by filter"
#docker images -a | grep "pattern" | awk '{print $3}' | xargs docker rmi

echo "remove all images"
#docker rmi $(docker images -a -q)

#with filter
docker images -q --filter "dangling=true"
docker rmi $(docker images -q --filter "dangling=true")
