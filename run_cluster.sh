#!/bin/bash

docker network create hadoop_network

docker build -t hadoop-base:3.3.1 -f Dockerfile-hadoop .
docker-compose -f docker-compose-hadoop.yml up -d
