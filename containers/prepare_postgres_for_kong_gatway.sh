#!/bin/bash
source ./config.conf
podman run -it \
    --rm \
    --network=$PODMAN_KONG_NETWORK \
    -e "KONG_DATABASE=postgres" \
    -e "KONG_PG_HOST=$POSTGRES_KONG_HOST" \
    -e "KONG_PG_PASSWORD=$POSTGRES_KONG_PASSWORD" \
    kong:$KONG_GATEWAY_OSS_VERSION kong migrations bootstrap