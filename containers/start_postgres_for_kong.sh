#!/bin/bash
source ./config.conf
podman run -it \
    --rm=true \
    --name $POSTGRES_KONG_HOST \
    --network=$PODMAN_KONG_NETWORK \
    -e POSTGRES_USER=$POSTGRES_KONG_USER \
    -e POSTGRES_PASSWORD=$POSTGRES_KONG_PASSWORD \
    -e POSTGRES_DB=$POSTGRES_KONG_DB \
    -p 5442:5432 \
    postgres:15