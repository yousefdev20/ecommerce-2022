#!/bin/bash

echo "stop IronRedis running container."
sudo docker stop IronRedis
echo "the IronRedis container is down."
echo "stop ironApp running container."
sudo docker stop ironApp
echo "the ironApp container is down."
echo "stop ironDatabase running container."
sudo docker stop ironDatabase
echo "the ironDatabase container is down."
echo "stop ironNginx running container."
sudo docker stop ironNginx
echo "the ironNginx container is down."
echo "run iron project."
sudo docker-compose up -d --build
echo "iron up in running."
