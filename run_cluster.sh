#!/bin/bash

docker build -t hadoop-base:3.2.1 .
docker-compose up
