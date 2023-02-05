#!/bin/bash

docker build -t spark-base:3.3.1 .
docker-compose up -d
