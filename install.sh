#!/bin/bash

# Colors
RESET_COLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'

# Install nvm. Clones the nvm repository to ~/.nvm, and attempts to export the
# source lines the correct profile file (~/.bash_profile, ~/.zshrc, ~/.profile, or ~/.bashrc).
echo -e "${GREEN}Installing nvm...${RESET_COLOR}"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Install node 18
echo -e "\n${GREEN}Installing node 18...${RESET_COLOR}"
nvm install 18
nvm use 18

# Frontend set up
echo -e "\n${GREEN}Setting up wtt_front...${RESET_COLOR}"
cd wtt_front
npm install
cd ..

# Backend set up
echo -e "\n${GREEN}Setting up wtt_server...${RESET_COLOR}"
cd wtt_server
npm ci
cp .env.example .env
cd ..

echo -e "\n${RED}You need to configure the environment variables in 'wtt_server/.env'. \
Ask a team member on Slack for the environment variables.${RESET_COLOR}"

cat wtt_server/.env

echo -e "\nEnter your sudo password to get into postgres docker easier (This adds '127.0.0.1 wtt_postgis' to /etc/hosts): "
echo '127.0.0.1 wtt_postgis' | sudo tee -a /etc/hosts
echo "Usage: psql -h wtt_postgis -U trees -d treedb"

# Install git-lfs for the sql files
OS_TYPE=$(uname)

if [ "${OS_TYPE}" == "Darwin" ]; then
  echo -e "\n${GREEN}${OS_TYPE} OS detected, installing git-lfs via brew${RESET_COLOR}"
  brew install git-lfs
fi

if [ "${OS_TYPE}" == "Linux" ]; then
  echo -e "\n${GREEN}${OS_TYPE} OS detected, installing git-lfs via apt-get${RESET_COLOR}"
  sudo apt-get install git-lfs
fi

# Db set up
echo -e "\n${GREEN}Setting up wtt_db...${RESET_COLOR}"
cd wtt_db
git lfs install
git lfs track "treedb.sql"
git add .gitattributes
cd ..
