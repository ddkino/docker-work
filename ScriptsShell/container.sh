
docker container ls -a | grep "Exited" | awk '{print $1}' | xargs docker rm -f

#with filter
docker container ls  -q --filter "status=exited"
docker ps -a -f status=exited -f status=created

docker rm $(<cmd sh>)

docker-compose down && docker-compose rm