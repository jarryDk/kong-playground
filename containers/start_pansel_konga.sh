#!/bin/bash
source ./config.conf
podman run -it \
    --rm \
    --name konga \
    --network=$PODMAN_KONG_NETWORK \
    -e "TOKEN_SECRET=SuperSecret" \
    -p 1337:1337 \
    pantsel/konga

#podman run -it \
#    --rm \
#    --name -konga \
#    --network=$PODMAN_KONG_NETWORK \
#    -e "NODE_ENV=production" \
#    -e "TOKEN_SECRET={{somerandomstring}}" \
#    pantsel/konga
