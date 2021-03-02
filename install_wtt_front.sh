#!/bin/bash

# clone front end repo
[[ -d wtt_front ]] || git clone https://github.com/waterthetrees/wtt_front.git

# find directory
wtt_front_dir="${PWD}/wtt_front"

# install node libraries
cd "${wtt_front_dir}"
echo "changed into this directory: ${wtt_front_dir}"
npm install
echo "ran npm install for: ${wtt_front_dir}"

# https://webpack.js.org/guides/installation/
npm install -g webpack:@4.44.1
echo "ran npm install for webpack:@4.44.1"
npm install -g webpack-cli:@3.3.12
echo "ran npm install for webpack:@4.44.1"
webpack -w