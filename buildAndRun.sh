#!/usr/bin/env bash

docker build --rm -t mziegle1/rating_service:run .

docker rmi $(docker images -f "dangling=true" -q)

docker run \
    -p 50033:50033 \
    -e RATING_SERVICE_PORT=50053 \
    -i -t --security-opt=seccomp:unconfined \
    --rm mziegle1/rating_service:run