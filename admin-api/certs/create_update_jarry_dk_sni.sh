#!/bin/bash

curl -i -s \
    -X POST http://localhost:8001/certificates/bdd97b68-cb7f-4abd-b491-010dcc8b4bb2/snis \
    -H "Content-Type: application/json" \
    -d @create-update-jarry-dk-sni.json