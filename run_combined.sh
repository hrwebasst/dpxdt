#!/bin/bash

./dpxdt/tools/run_server.py \
    --enable_api_server \
    --enable_queue_workers \
    --capture_timeout=60 \
    --release_server_prefix=http://0.0.0.0:5000/api \
    --queue_server_prefix=http://0.0.0.0:5000/api/work_queue \
    --queue_idle_poll_seconds=10 \
    --queue_busy_poll_seconds=10 \
    --pdiff_timeout=20 \
    --reload_code \
    --port=5000 \
    --verbose \
    --ignore_auth \
    $@
