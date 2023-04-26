#!/bin/bash

curl -i -s \
    -X POST http://localhost:8001/services \
    -H "Content-Type: application/json" \
    -d @create-todo-service.json

curl -i -s \
    -X POST http://localhost:8001/services/todo_service/routes \
    --data 'paths[]=/todos' \
    --data name=todo_route

curl -i -s \
    -X POST http://localhost:8001/upstreams \
    -H "Content-Type: application/json" \
    -d @create-todo-upstream.json

curl -i -s \
    -X POST http://localhost:8001/upstreams/todo_upstream/targets \
    --data target='kong-quarkus-todo:8080'

curl -i -s \
    -X POST http://localhost:8001/upstreams/todo_upstream/targets \
    --data target='kong-spring-todo:8080'