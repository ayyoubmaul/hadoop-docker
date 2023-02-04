#!/bin/bash

docker network create hadoop_network

docker build -t hadoop-base:3.3.1 -f Dockerfile-airflow .
docker-compose up -d
