#!/bin/bash

curl -i -s \
   -X POST http://localhost:8001/services/todo_cert_service/routes \
   -H "Content-Type: application/json" \
    -d @create-todo-cert-route.json