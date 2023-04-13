#!/bin/bash
source ./config.conf
podman run -it \
    --rm=true \
    --network=$PODMAN_KONG_NETWORK \
    --name=kong-spring-todo \
    -e spring.datasource.url=jdbc:postgresql://postgres-spring-playground:5432/hibernate_db \
    -p 8280:8080 jarrydk/kong-spring-todo