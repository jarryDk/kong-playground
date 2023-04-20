#!/bin/bash

source ./config.conf

printf "\033[32m-----------------------------------------------------\033[39m\n"
printf "\033[32mPostgreSQL will be listing on port 5462 on the host  \033[39m\n"
printf "\033[32m-----------------------------------------------------\033[39m\n"

podman run -dt \
    --rm=true \
    --name $POSTGRES_SPRING_HOST \
    --network=$PODMAN_KONG_NETWORK \
    -e POSTGRES_USER=$POSTGRES_SPRING_USER \
    -e POSTGRES_PASSWORD=$POSTGRES_SPRING_PASSWORD \
    -e POSTGRES_DB=$POSTGRES_SPRING_DB \
    -p 5462:5432 \
    postgres:15