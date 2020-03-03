#!/bin/sh
echo "Starting Docker Daemon"
dockerd &
echo "Starting Docker Compose"
docker-compose up --scale chrome=3