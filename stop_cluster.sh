#!/bin/bash

# Stop Airflow
docker-compose -f docker-compose-airflow.yml down
# Stop Hadoop
docker-compose -f docker-compose-hadoop.yml down

# Run Spark Cluster
if [[ "$PWD" != "spark" ]]; then
  cd spark && docker-compose down && cd ..
fi

echo "All services stoped"
