#!/bin/bash
# Use this script to clone all the repos in one go.
# If you have ssh permission, it will clone using ssh.
# Otherwise, it will clone using https.
# This script is meant to be run from the parent directory of all the repos. Once you clone waterthetrees/waterthetrees, you can run this script to clone all the other repos.
# Usage: ./clone_repos.sh from the waterthetrees directory.
# wtt_db is the only repo that uses git-lfs, so it will be cloned using git-lfs. It clones and tracks the treedb.sql postgres database dump file.

ORG="waterthetrees/"
REPOS=("wtt_db" "wtt_front" "wtt_server" "tree-sources")

has_ssh_permission() {
  echo "Testing ssh permission..."
  ssh -T git@github.com
}

clone_repo() {
  if [[ -d $1 ]]; then
    echo "Directory ${1} already exists! Skipping..."
  else
    git clone "${GIT_PREFIX}${ORG}${1}.git"
    echo -e "\n${GREEN}clone...${GIT_PREFIX}${ORG}${1}.git"
    # git@github.com:waterthetrees/waterthetrees.git
  fi
}

clone_all_repos() {
  for i in ${REPOS[@]}; 
    do clone_repo $i; 
  done
}

if has_ssh_permission; then
  echo "You have ssh permission!"
  echo "Trying to clone using ssh..."
  GIT_PREFIX='git@github.com:'
else
  echo "ssh failed!"
  echo "Trying to clone using https instead..."
  GIT_PREFIX='https://github.com/'
fi

clone_all_repos || echo "Failed to clone all repos!"
