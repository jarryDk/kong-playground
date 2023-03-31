#!/bin/bash

curl -X POST http://localhost:8001/upstreams \
  --data name=mock_upstream