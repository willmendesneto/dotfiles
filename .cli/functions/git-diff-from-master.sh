#!/bin/bash
# Check diffs and filter them by changes in a folder folder
function git-diff-folder() {
  git diff "$2"..HEAD "$1" ':(exclude)/__tests__/**/*.ts'
}

alias diff-folder="git-diff-folder";
