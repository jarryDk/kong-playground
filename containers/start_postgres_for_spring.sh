#!/bin/bash
source ./config.conf
podman run -it \
    --rm=true \
    --name $POSTGRES_SPRING_HOST \
    --network=$PODMAN_KONG_NETWORK \
    -e POSTGRES_USER=$POSTGRES_SPRING_USER \
    -e POSTGRES_PASSWORD=$POSTGRES_SPRING_PASSWORD \
    -e POSTGRES_DB=$POSTGRES_SPRING_DB \
    -p 5462:5432 \
    postgres:15