#!/bin/bash

curl -i -s \
    -X POST http://localhost:8001/certificates \
    -H "Content-Type: application/json" \
    -d @cert_jarry_dk.json