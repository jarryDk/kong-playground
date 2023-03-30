#!/bin/bash

curl -X POST http://localhost:8001/upstreams -H "Content-Type: application/json" -d @create-todo-upstream.json