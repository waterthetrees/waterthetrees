#!/bin/bash

has_ssh_permission() {
  echo "Testing ssh permission..."
  ssh -T git@github.com
}

clone_repo() {
  if [[ -d $1 ]]; then
    echo "Directory ${1} already exists! Skipping..."
  else
    git clone "${GIT_PREFIX}waterthetrees/${1}.git"
  fi
}

clone_all_repos() {
  clone_repo "wtt_db"
  clone_repo "wtt_front"
  clone_repo "wtt_server"
  clone_repo "tree-source"
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
