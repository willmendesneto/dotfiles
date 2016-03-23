# Add new remote repository based in your informations
#
# How to use
#
# $ cd <your-local-git-repository>
# $ git-add-remote <remote-name> <remote-git-address>
#
function git-add-remote() {

  # no keyword provided, simply show how call methods
  if [[ $# -le 1 ]]; then
    echo "Please provide \"repo name\" and \"repo address\" .\nEx:\ngit-add-remote <repo-name> <repo-address>\n"
    return 1
  fi

  local REPO_NAME="$1"
  local REPO_ADDRESS="$2"

  git remote add $REPO_NAME $REPO_ADDRESS
  git fetch $REPO_NAME
  git checkout master
  git merge $REPO_NAME/master
}
