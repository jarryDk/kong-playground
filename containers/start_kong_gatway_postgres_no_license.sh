#!/bin/bash
source ./config.conf
podman run -it \
    --privileged \
    --rm \
    --name kong-gateway \
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
    -e "KONG_ADMIN_GUI_URL=http://localhost:8002" \
    -p 8000:8000 \
    -p 8443:8443 \
    -p 8001:8001 \
    -p 8444:8444 \
    -p 8002:8002 \
    -p 8445:8445 \
    -p 8003:8003 \
    -p 8004:8004 \
    kong/kong-gateway:$KONG_GATEWAY_VERSION
