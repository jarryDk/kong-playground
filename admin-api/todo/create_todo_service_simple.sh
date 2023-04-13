#!/bin/bash

curl -i -s -X POST http://localhost:8001/services \
  --data name=todo_service \
  --data host='todo.jarry.dk'