#!/bin/bash

source ../cluster.env

$DOCKER build -t localhost/airflow-hadoop-base:3.3.6 .
