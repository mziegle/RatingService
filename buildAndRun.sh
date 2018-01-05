#!/usr/bin/env bash

docker build --rm -t mziegle1/rating_service:run .

docker rmi $(docker images -f "dangling=true" -q)

docker run \
    -p 40003:40003 \
    -e RATING_SERVICE_PORT=40003 \
    -i -t --security-opt=seccomp:unconfined \
    --rm mziegle1/rating_service:run