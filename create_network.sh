#!/bin/bash

PODMAN_NETWORKS_LOOKUP=$(podman network ls --format json | jq  -r '[ .[].name ] | @csv' | tr -d '"')
IFS=',' read -r -a PODMAN_NETWORKS <<< "$PODMAN_NETWORKS_LOOKUP"

echo "podman networks :"
printf "+ %s\n"  "${PODMAN_NETWORKS[@]}"
echo

if [[ " ${PODMAN_NETWORKS[*]} " =~ "kong-net" ]]; then
    echo "We already have kong-net as a network"
else
    echo "We create kong-net as a network"
    podman network create kong-net
fi
