#!/bin/bash

# https://docs.konghq.com/gateway/3.2.x/kong-enterprise/dev-portal/enable/

echo "KONG_PORTAL_GUI_HOST=localhost:8003 KONG_PORTAL=on kong reload exit" \
   | docker exec -i kong-dbless-no-license /bin/sh

curl -i -X PATCH http://localhost:8001/workspaces/default \
   --data "config.portal=true"

firefox http://localhost:8003/default