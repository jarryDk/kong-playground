#!/bin/bash
source ./config.conf
podman run -it \
    --rm=true \
    --network=$PODMAN_KONG_NETWORK \
    --name=kong-quarkus-todo \
    -p 8180:8080 jarrydk/kong-quarkus-todo