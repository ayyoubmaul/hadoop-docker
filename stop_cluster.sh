#!/bin/bash

source cluster.env

# Stop Airflow
$DOCKER_COMPOSE -f docker-compose-airflow.yml down
# Stop Hadoop
$DOCKER_COMPOSE -f docker-compose-hadoop.yml down

# Run Spark Cluster
if [[ "$PWD" != "spark" ]]; then
  cd spark && $DOCKER_COMPOSE down && cd ..
fi

echo "All services stoped"
