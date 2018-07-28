# 
# Remove your local git repository and clone again
#
# How to use
#
# $ cd <your-local-git-repository>
# $ reclone

function reclone() {
  local REPOSITORY_GITHUB_NAME="$(git config --get remote.origin.url)"
  local REPOSITORY_FOLDER=${PWD##*/}
  cd ../ && rm -rf $REPOSITORY_FOLDER
  git clone $REPOSITORY_GITHUB_NAME $REPOSITORY_FOLDER && cd $REPOSITORY_FOLDER
  echo "All done! You have new content in the current folder"
}
