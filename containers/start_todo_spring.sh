#!/bin/bash

source ./config.conf

podman run -d \
    --rm=true \
    --network=$PODMAN_KONG_NETWORK \
    --name=$TODO_SPRING_HOST \
    -e spring.datasource.url=jdbc:postgresql://$POSTGRES_SPRING_HOST:$POSTGRES_SPRING_PORT/$POSTGRES_SPRING_DB \
    -e spring.datasource.username=$POSTGRES_SPRING_USER \
    -e spring.datasource.password=$POSTGRES_SPRING_PASSWORD \
    -p $TODO_SPRING_PORT:8080 \
    jarrydk/kong-spring-todo

podman logs -f $TODO_SPRING_HOST