#!/bin/bash

# Install nvm. Clones the nvm repository to ~/.nvm, and attempts to export the
# source lines the correct profile file (~/.bash_profile, ~/.zshrc, ~/.profile, or ~/.bashrc).
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Install node 18
nvm install 18
nvm use 18

# Frontend set up
cd wtt_front
npm install
cd ..

# Backend set up
cd wtt_server
npm install
cp .env.example .env
cat .env
cd ..

echo "Done installing npm packages"
echo "Ask on slack for the environment variables and paste the contents into the .env file"

echo "To get into postgres docker easier"
echo "Enter password for sudo to echo 127.0.0.1 wtt_postgis to /etc/hosts"
echo '127.0.0.1 wtt_postgis' | sudo tee -a /etc/hosts
echo "Usage: psql -h wtt_postgis -U trees -d treedb"

# Install git-lfs for the sql files
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

# Db set up
cd wtt_db
git lfs install
git lfs track "treedb.sql"
git add .gitattributes
cd ..
