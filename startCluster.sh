#!/bin/bash
set -e

HOST_IP=$1
docker run --name consul -h $HOSTNAME \
    -p ${HOST_IP}:8300:8300 \
    -p ${HOST_IP}:8301:8301 \
    -p ${HOST_IP}:8301:8301/udp \
    -p ${HOST_IP}:8302:8302 \
    -p ${HOST_IP}:8302:8302/udp \
    -p ${HOST_IP}:8400:8400 \
    -p ${HOST_IP}:8500:8500 \
    -p 172.17.42.1:53:53 \
    -p 172.17.42.1:53:53/udp \
    -d progrium/consul -server -advertise ${HOST_IP} \
    -bootstrap-expect 3 \
    -ui-dir /ui
