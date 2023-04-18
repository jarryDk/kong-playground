#!/bin/bash
source ./config.conf
podman run -it \
    --rm \
    --name kong-gateway-oss \
    --network=$PODMAN_KONG_NETWORK \
    -e "KONG_DATABASE=postgres" \
    -e "KONG_PG_HOST=$POSTGRES_KONG_HOST" \
    -e "KONG_PG_USER=$POSTGRES_KONG_USER" \
    -e "KONG_PG_PASSWORD=$POSTGRES_KONG_PASSWORD" \
    -e "KONG_PROXY_ACCESS_LOG=/dev/stdout" \
    -e "KONG_ADMIN_ACCESS_LOG=/dev/stdout" \
    -e "KONG_PROXY_ERROR_LOG=/dev/stderr" \
    -e "KONG_ADMIN_ERROR_LOG=/dev/stderr" \
    -e "KONG_ADMIN_LISTEN=0.0.0.0:8001" \
    -e "KONG_ADMIN_GUI_URL=http://localhost:8002, 0.0.0.0:8444 ssl" \
    -p 8000:8000 \
    -p 8443:8443 \
    -p 127.0.0.1:8001:8001 \
    -p 127.0.0.1:8444:8444 \
    kong:$KONG_GATEWAY_OSS_VERSION
