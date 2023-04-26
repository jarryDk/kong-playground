#!/bin/bash

source ./config.conf

podman run -d \
    --rm=true \
    --network=$PODMAN_KONG_NETWORK \
    --name=$TODO_QUARKUS_HOST \
    -e QUARKUS_DATASOURCE_USERNAME=$POSTGRES_QUARKUS_USER \
    -e QUARKUS_DATASOURCE_PASSWORD=$POSTGRES_QUARKUS_PASSWORD \
    -e QUARKUS_DATASOURCE_JDBC_URL=jdbc:postgresql://$POSTGRES_QUARKUS_HOST:$POSTGRES_QUARKUS_PORT/$POSTGRES_QUARKUS_DB \
    -p $TODO_QUARKUS_PORT:8080 \
    jarrydk/kong-quarkus-todo

podman logs -f $TODO_QUARKUS_HOST