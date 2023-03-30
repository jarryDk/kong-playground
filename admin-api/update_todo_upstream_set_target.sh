#!/bin/bash

curl -X POST http://localhost:8001/upstreams/todo-spring/targets \
  --data target='mockbin.org:80'

curl -X POST http://localhost:8001/upstreams/todo-spring/targets \
  --data target='httpbin.org:80'