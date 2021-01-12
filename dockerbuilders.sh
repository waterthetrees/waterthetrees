#!/bin/bash

set -e

[[ -d waterthetrees ]] || mkdir waterthetrees
cd waterthetrees
[[ -d wtt_db ]] || git clone https://github.com/waterthetrees/wtt_db.git
[[ -d wtt_server ]] || git clone https://github.com/waterthetrees/wtt_server.git
[[ -d wtt_front ]] || git clone https://github.com/waterthetrees/wtt_front.git

POSTGRES_ID=${POSTGRES_ID:-postgres}
POSTGRES_TAG=${POSTGRES_TAG:-latest}
NODE_ID=${POSTGRES_ID:-postgres}
NODE_TAG=${POSTGRES_TAG:-latest}

IS_POSTGRES_UP=[ "$(docker inspect "${POSTGRES_ID}:${POSTGRES_TAG}" > /dev/null 2>&1)" != "" ]
IS_NODE_UP=[ "$(docker inspect "${NODE_ID}:${NODE_TAG}" > /dev/null 2>&1)" != "" ]

if [ IS_POSTGRES_UP && IS_NODE_UP]; then
	docker-compose up --detach
 echo "${POSTGRES_ID}:${POSTGRES_TAG} docker-compose up."
 echo "${NODE_ID}:${NODE_TAG} docker-compose up --build."
else
	docker-compose up --build --detach
 echo "${POSTGRES_ID}:${POSTGRES_TAG} docker-compose up --build."
 echo "${NODE_ID}:${NODE_TAG} docker-compose up --build."
fi

echo "${POSTGRES_ID}:${POSTGRES_TAG} created."
docker images
docker container ls