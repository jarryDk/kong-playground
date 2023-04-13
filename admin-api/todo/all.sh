#!/bin/bash

./create_todo_service.sh

./create_todo_route.sh

./create_todo_upstream.sh

./update_todo_service_to_use_todo_upstream.sh

./update_todo_upstream_set_target.sh