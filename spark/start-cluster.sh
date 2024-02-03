#!/bin/bash

docker build -t spark-base:3.5.0 .
docker-compose up -d
