#!/bin/bash

curl -X POST http://localhost:8001/upstreams/mock_upstream/targets \
  --data target='mockbin.org:80'

curl -X POST http://localhost:8001/upstreams/mock_upstream/targets \
  --data target='httpbin.org:80'