#!/bin/bash

curl -X PATCH http://localhost:8001/services/todo_cert_service \
  --data host='todo_cert_upstream'