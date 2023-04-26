#!/bin/bash

curl -i -s \
    -X POST http://localhost:8001/services \
    -H "Content-Type: application/json" \
    -d @create-todo-cert-service.json

curl -i -s \
   -X POST http://localhost:8001/services/todo_cert_service/routes \
   -H "Content-Type: application/json" \
    -d @create-todo-cert-route.json

curl -i -s \
    -X POST http://localhost:8001/upstreams \
    -H "Content-Type: application/json" \
    -d @create-todo-cert-upstream.json

curl -i -s \
    -X PATCH http://localhost:8001/services/todo_cert_service \
    --data host='todo_cert_upstream'

curl -i -s \
    -X POST http://localhost:8001/upstreams/todo_cert_upstream/targets \
    --data target='kong-quarkus-todo:8080'

curl -i -s \
    -X POST http://localhost:8001/upstreams/todo_cert_upstream/targets \
    --data target='kong-spring-todo:8080'