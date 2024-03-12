#!/bin/bash

source cluster.env

# containers write into logs and output
chmod -R a+w logs output

# create new network
$DOCKER network create hadoop_network

# build docker image with image name hadoop-base:3.3.6
$DOCKER build -t localhost/hadoop-base:3.3.6 -f Dockerfile-hadoop .
# running image to container, -d to run it in daemon mode
$DOCKER_COMPOSE -f docker-compose-hadoop.yml up -d

# Run Airflow Cluster
if [[ "$PWD" != "airflow" ]]; then
  cd airflow && ./run_airflow.sh && cd ..
fi

$DOCKER_COMPOSE -f docker-compose-airflow.yml up -d

# Run Spark Cluster
if [[ "$PWD" != "spark" ]]; then
  cd spark && ./start-cluster.sh && cd ..
fi

echo "Current dir is $PWD"
