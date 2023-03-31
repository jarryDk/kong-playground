#!/bin/bash

curl -i -s \
    -X POST http://localhost:8001/services \
    -H "Content-Type: application/json" \
    -d @create-todo-service.json