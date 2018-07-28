#!/bin/bash
# Sync local repository with remote repo
# by:
#  https://github.com/willmendesneto

function git-sync-fork() {

  REMOTE_NAME='upstream'

  if [[ -n "$1" && -n "$2" ]]; then
    REMOTE_NAME=$1
    git remote add $REMOTE_NAME $2
  fi

  # fetch with main repository
  git fetch $REMOTE_NAME

  # move to master
  git checkout master

  # rebase with remote repository
  git rebase $REMOTE_NAME/master
}

alias sync-fork="git-sync-fork";
