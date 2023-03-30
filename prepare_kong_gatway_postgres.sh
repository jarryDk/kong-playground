#!/bin/bash
source ./config.conf
podman run -it \
    --rm \
    --network=$POSTGRES_KONG_NETWORK \
    -e "KONG_DATABASE=postgres" \
    -e "KONG_PG_HOST=$POSTGRES_KONG_HOST" \
    -e "KONG_PG_PASSWORD=$POSTGRES_KONG_PASSWORD" \
    kong/kong-gateway:$KONG_GATEWAY_VERSION kong migrations bootstrap