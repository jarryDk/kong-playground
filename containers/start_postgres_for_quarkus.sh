#!/bin/bash
source ./config.conf
podman run -it \
    --rm=true \
    --name $POSTGRES_QUARKUS_HOST \
    --network=$PODMAN_KONG_NETWORK \
    -e POSTGRES_USER=$POSTGRES_QUARKUS_USER \
    -e POSTGRES_PASSWORD=$POSTGRES_QUARKUS_PASSWORD \
    -e POSTGRES_DB=$POSTGRES_QUARKUS_DB \
    -p 5452:5432 \
    postgres:15