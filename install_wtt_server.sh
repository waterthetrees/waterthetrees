#!/bin/bash

# clone server repo
[[ -d wtt_server ]] || git clone https://github.com/waterthetrees/wtt_server.git

# find directory
wtt_server_dir="${PWD}/wtt_server"

# install node libraries
cd "${wtt_server_dir}"
echo "changed into this directory: ${wtt_server_dir}"
npm install
echo "ran npm install for: ${wtt_server_dir}"