#!/bin/bash

#curl -X POST http://localhost:8001/upstreams/todo_upstream/targets \
#  --data target='mockbin.org:80'

curl -X POST http://localhost:8001/upstreams/todo_upstream/targets \
  --data target='kong-quarkus-todo:8080'

curl -X POST http://localhost:8001/upstreams/todo_upstream/targets \
  --data target='kong-spring-todo:8080'