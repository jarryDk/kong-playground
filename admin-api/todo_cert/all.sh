#!/bin/bash

./create_todo_cert_service.sh

./create_todo_cert_route.sh

./create_todo_cert_upstream.sh

./update_todo_cert_service_to_use_todo_cert_upstream.sh

./update_todo_cert_upstream_set_target.sh