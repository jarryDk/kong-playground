#!/bin/bash

curl -X POST \
    http://localhost:8001/certificates \
    -H 'Content-Type: multipart/form-data' \
    -F cert=@/home/micbn/certs/fullchain.pem \
    -F key=@/home/micbn/certs/privkey.pem \
    -F snis[]=jarry.dk \
    -F snis[]=keycloak.jarry.dk \
    -F snis[]=kinabogen.jarry.dk \
    -F snis[]=update.jarry.dk \
    -F snis[]=www.jarry.dk