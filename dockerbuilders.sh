#!/bin/bash

# [[ -d wtt_db ]] || git clone https://github.com/waterthetrees/wtt_db.git
# [[ -d wtt_server ]] || git clone https://github.com/waterthetrees/wtt_server.git
# [[ -d wtt_front ]] || git clone https://github.com/waterthetrees/wtt_front.git

POSTGRES_ID=${POSTGRES_ID:-postgres}
POSTGRES_TAG=${POSTGRES_TAG:-latest}
# NODE_ID=${NODE_ID:-node}
# NODE_TAG=${NODE_TAG:-latest}

IS_POSTGRES_UP=$(docker inspect "${POSTGRES_ID}:${POSTGRES_TAG}" 2> /dev/null)
echo "$IS_POSTGRES_UP $POSTGRES_ID postgres test1"

# IS_NODE_UP=$(docker inspect "${NODE_ID}:${NODE_TAG}" 2> /dev/null)
# echo "$IS_NODE_UP $NODE_ID node test1"

if 	[ "x${IS_POSTGRES_UP}" == "x" ] || [ "x${IS_NODE_UP}" == "x" ]; then
	 echo "$IS_POSTGRES_UP $POSTGRES_ID postgres docker-compose up  --build --detach"
		# echo "${NODE_ID}:${NODE_TAG} docker-compose up  --build --detach"
		docker-compose up --build --detach
else 
		echo "$IS_POSTGRES_UP $POSTGRES_ID postgres docker-compose up --detach"
		# echo "${NODE_ID}:${NODE_TAG} docker-compose up --detach"
		docker-compose up --detach
fi

docker images
docker container ls