#!/bin/bash

curl -i -X POST http://localhost:8001/services/mock_service/routes \
  --data 'paths[]=/mock' \
  --data name=mock_route