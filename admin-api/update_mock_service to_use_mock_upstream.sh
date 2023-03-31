#!/bin/bash

curl -X PATCH http://localhost:8001/services/mock_service \
  --data host='mock_upstream'