#!/bin/bash

curl -i -s \
    -X POST http://localhost:8001/ca_certificates \
    -H "Content-Type: application/json" \
    -d @cert_ca-id-5cd9d8d7-5f15-43bf-8677-02621cff7c05.json

curl -i -s \
    -X POST http://localhost:8001/ca_certificates \
    -H "Content-Type: application/json" \
    -d @cert_ca-id-ed9b5a35-6c22-4ea0-8dfa-a52ce8a1f4c1.json