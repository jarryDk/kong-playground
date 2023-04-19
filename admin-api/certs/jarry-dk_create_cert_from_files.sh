#!/bin/bash

DNS=jarry.dk
CERTFICATE_ID=b2a67312-21ba-42ba-882c-8536a6a0cbf7

ROOT_FOLDER=/etc/letsencrypt/live

if [ ! -d $ROOT_FOLDER ]; then
    echo "Change ROOT_FOLDER to $HOME/certs"
    ROOT_FOLDER=$HOME/certs
fi

FULLCHAIN_PEM_PATH=$ROOT_FOLDER/$DNS/fullchain.pem
PRIVKEY_PEM_PATH=$ROOT_FOLDER/$DNS/privkey.pem

sudo curl -X POST \
    http://localhost:8001/certificates \
    -H 'Content-Type: multipart/form-data' \
    -F cert=@$FULLCHAIN_PEM_PATH \
    -F key=@$PRIVKEY_PEM_PATH \
    -F snis[1]=jarry.dk \
    -F snis[2]=keycloak.jarry.dk \
    -F snis[3]=kinabogen.jarry.dk \
    -F snis[4]=update.jarry.dk \
    -F snis[5]=www.jarry.dk \
    -F id=$CERTFICATE_ID \
    -F tags[]=$DNS