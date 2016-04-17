#!/bin/bash
# Fully sync the remote repo with the local repo
# by:
#  https://github.com/{amferraz,robsonpeixoto}

function git-full-sync() {

  # get current branch name
  CURRENT_BRANCH=`git rev-parse --abbrev-ref HEAD`
  MOVE_TO_CURRENT_BRANCH=1

  # store changes
  STASH_RESULT=`git stash`

  # move to master
  git checkout master

  # fetch latest changes
  git pull --rebase

  # remove unexistent remotes
  git remote prune origin

  # remove already merged branches
  for BRANCHE in `git branch --merged | grep -v "\*"`; do
    if [ "$CURRENT_BRANCH" == "$BRANCHE" ]; then
      MOVE_TO_CURRENT_BRANCH=0
    fi
    git branch -d $BRANCHE
  done

  # move again to the original branch
  if [ $MOVE_TO_CURRENT_BRANCH == 1 ]; then
    git checkout $CURRENT_BRANCH
  fi

  # re-apply local changes
  if [ "$STASH_RESULT" != "No local changes to save" ]
  then
      git stash pop
  else
      echo "No local changes were found."
  fi
}

alias sync-repo="git-full-sync";
