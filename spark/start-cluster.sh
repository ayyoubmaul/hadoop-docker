#!/bin/bash

source ../cluster.env

$DOCKER build -t localhost/spark-base:3.5.1 .
$DOCKER_COMPOSE up -d
