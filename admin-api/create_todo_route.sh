#!/bin/bash

curl -i -X POST http://localhost:8001/services/todo_service/routes \
  --data 'paths[]=/todos' \
  --data name=todo_route