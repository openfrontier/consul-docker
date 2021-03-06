#!/bin/bash
set -e

HOST_IP=$1
docker run --name consul -h $HOSTNAME \
    --restart=unless-stopped \
    -p 8300:8300 \
    -p 8301:8301 \
    -p 8301:8301/udp \
    -p 8302:8302 \
    -p 8302:8302/udp \
    -p 8400:8400 \
    -p 8500:8500 \
    -d progrium/consul -advertise ${HOST_IP} \
    -server \
    -bootstrap-expect 3 \
    -ui-dir /ui
