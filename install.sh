#!/bin/bash

# Substitute variables here
CURRENT_OS="Darwin" #Linux are other valid options


curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

nvm install 18
nvm use 18

# Write docker names to /etc/hosts
echo '127.0.0.1 wtt_postgis' | sudo tee -a /etc/hosts

# Install git-lfs for the sql files
cd wtt_db   
echo $(uname)

OS_TYPE=$(uname)
echo "${OS_TYPE}"

if [ "${OS_TYPE}" == "Darwin" ]; then
  echo "$OS_TYPE OS detected, installing git-lfs via brew"
  brew install git-lfs
fi

if [ "${OS_TYPE}" == "Linux" ]; then
  echo "$OS_TYPE OS detected, installing git-lfs via apt-get"
  sudo apt-get install git-lfs
fi

git lfs install
# # git lfs track "*.psd"
git lfs track "treedb.sql"
git add .gitattributes

