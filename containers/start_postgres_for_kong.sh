#!/bin/bash

source ./config.conf

printf "\033[32m-----------------------------------------------------\033[39m\n"
printf "\033[32mPostgreSQL will be listing on port $POSTGRES_KONG_PORT on the host  \033[39m\n"
printf "\033[32m-----------------------------------------------------\033[39m\n"

podman run -dt \
    --rm=true \
    --name $POSTGRES_KONG_HOST \
    --network=$PODMAN_KONG_NETWORK \
    -e POSTGRES_USER=$POSTGRES_KONG_USER \
    -e POSTGRES_PASSWORD=$POSTGRES_KONG_PASSWORD \
    -e POSTGRES_DB=$POSTGRES_KONG_DB \
    -p $POSTGRES_KONG_PORT:5432 \
    postgres:15

podman logs -f $POSTGRES_KONG_HOST