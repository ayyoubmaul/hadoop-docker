#!/bin/bash

# build images that listed in docker-compose-build.yml
docker-compose -f docker-compose-build.yml build
