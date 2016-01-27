#!/bin/bash
set -e

docker exec consul consul leave
