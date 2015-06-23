#!/bin/bash
set -e

HOST_IP=$1
JOIN_IP=$2
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
    -d progrium/consul -advertise ${HOST_IP} \
    -join ${JOIN_IP}
