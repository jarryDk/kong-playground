#!/bin/bash

curl -i -s \
    -X POST http://localhost:8001/upstreams \
    -H "Content-Type: application/json" \
    -d @create-todo-cert-upstream.json