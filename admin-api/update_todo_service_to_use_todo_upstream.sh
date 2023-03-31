#!/bin/bash

curl -X PATCH http://localhost:8001/services/todo_service \
  --data host='todo_upstream'