#!/bin/sh

# Argument: image id of your server image
{ # try
    docker network create --subnet=172.99.0.0/16 custom-net

} || { # catch
    docker network rm custom-net && docker network create --subnet=172.99.0.0/16 custom-net
}
serverImageId=$1
docker run --net custom-net --ip 172.99.0.2 $serverImageId