#!/bin/bash

curl -i -s -X POST http://localhost:8001/services \
  --data name=mock_service \
  --data host='mockbin.org'