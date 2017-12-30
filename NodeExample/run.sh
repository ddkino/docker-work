#!/bin/sh
# when a name is given it's a container name
# so if you want multiple instances of the same remove -name
# -name convenient for restarting docker start $name

if [ $1 = '--help' ] || [ $1 = '-h' ]
then
    echo "arguments -p|--port=<port_listen> -n|--name=<container_name>"
    exit
fi

ID_TIME=`date +%H%M%S`

CONTAINER_NAME="default-nodejs-example.$ID_TIME"
PORT_LISTEN=4545

for i in "$@"
do
    case $i in
        -p=*|--port=*)
            PORT_LISTEN="${i#*=}"
            shift # past argument=value
        ;;
        -n=*|--name=*)
            CONTAINER_NAME="${i#*=}"
            shift # past argument=value
        ;;
        --default)
            DEFAULT=YES
            shift # past argument with no value
        ;;
        *)
            # unknown option
        ;;
    esac
done

printf "Argument CONTAINER_NAME is %s\n" "$CONTAINER_NAME"
printf "Argument PORT_LISTEN is %s\n" "$PORT_LISTEN"


docker run -p $PORT_LISTEN:8080 --name $CONTAINER_NAME -d dede/node-app-js:carbon
docker ps | grep -i $CONTAINER_NAME