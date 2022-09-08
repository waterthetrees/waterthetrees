#!/bin/bash

CLONE_TYPE='ssh' # or https
GIT_PREFIX='git@github.com:' # or https://github.com/

if [ "$CLONE_TYPE" == "ssh" ]; then
  GIT_PREFIX='git@github.com:'
fi

if [ "$CLONE_TYPE" == "https" ]; then
  GIT_PREFIX='https://github.com/'
fi

echo "Cloning repos"
# Clones db
[[ -d wtt_db ]] || git clone "${GIT_PREFIX}waterthetrees/wtt_db.git"
# Clones frontend
[[ -d wtt_front ]] || git clone "${GIT_PREFIX}waterthetrees/wtt_front.git"
# Clones server
[[ -d wtt_server ]] || git clone "${GIT_PREFIX}waterthetrees/wtt_server.git"
# Clones tree_sources data
[[ -d tree-source ]] || git clone "${GIT_PREFIX}waterthetrees/tree-source.git"




