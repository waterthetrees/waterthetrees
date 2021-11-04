#!/bin/bash

# Substitute variables here
ORG='waterthetrees'
PUB_KEY='~/.ssh/id_rsa.pub'
USERNAME='youruser'
TOKEN="yourtoken"
# GITHUB_INSTANCE="<GITHUB INSTANCE>

brew install jq
curl -s https://$USERNAME:$TOKEN@api.github.com/orgs/$ORG/repos?per_page=100 | jq ".[].ssh_url" | xargs -n 1 git clone
mv wtt* $ORG/

# Write docker names to /etc/hosts
echo '127.0.0.1 wtt_postgis' | sudo tee -a /etc/hosts
echo '127.0.0.1 wtt_vectortiles' | sudo tee -a /etc/hosts
echo '127.0.0.1 wtt_front' | sudo tee -a /etc/hosts
echo '127.0.0.1 wtt_server' | sudo tee -a /etc/hosts

# Clones martin
export HOMEBREW_CORE_GIT_REMOTE="..."  # put your Git mirror of Homebrew/homebrew-core here
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# # Install git-lfs for the sql files
cd wtt_db
brew install git-lfs
git lfs install
# # git lfs track "*.psd"
git lfs track "treedb.sql"
git add .gitattributes
