#!/bin/bash

# Clones wtt_server, wtt_front, and wtt_db
./clone_repos.sh

echo "$IS_POSTGRES_UP $POSTGRES_ID postgres docker-compose up --detach"
echo "${NODE_ID}:${NODE_TAG} docker-compose up --detach"

# Use this command to bring Docker containers back online
docker-compose up --detach