#!/bin/bash
#
# Get all atlaskit package versions to be bumped by package and version
#
# How to use
#
# $ cd <your-atlaskit-project>
# $ get-ak-package-versions-by-tag (-p|--pkg-version)
# 
# EX:
# get-ak-package-versions-by-tag --pkg=editor-jira-transformer --version=7.2.2 --branch=my-branch
#

function get-ak-package-versions-by-tag() {

  ATLASKIT_PACKAGE_NAME=""
  ATLASKIT_PACKAGE_VERSION=""
  GIT_BRANCH_NAME=""

  for i in "$@"
  do
    case $i in
        -p=*|--pkg=*)
        ATLASKIT_PACKAGE_NAME="${i#*=}"
        shift # past argument=value
        ;;
        -v=*|--version=*)
        ATLASKIT_PACKAGE_VERSION="${i#*=}"
        shift # past argument=value
        ;;
        -b=*|--branch=*)
        GIT_BRANCH_NAME="${i#*=}"
        shift # past argument=value
        ;;
        --default)
        shift # past argument with no value
        ;;
        *)
          # unknown option
        ;;
    esac
  done

  if [ "$ATLASKIT_PACKAGE_NAME" == "" ] || [ "$ATLASKIT_PACKAGE_VERSION" == "" ] || [ "$GIT_BRANCH_NAME" == "" ]; then
    echo "Please pass a package name, version and git branch to be created by the command";
    echo "get-ak-package-versions-by-tag (-p|--pkg) (-v|--version) (-b|--branch)";
    echo "";
    echo "EX:";
    echo "get-ak-package-versions-by-tag --pkg=editor-jira-transformer --version=7.2.2 --branch=my-branch";
    echo "";
  else
  
    echo "Updating repository with latest changes in master ..."
    git pull --rebase --tags origin master
    echo ">>> Removing old bundle ..."
    g checkout "tags/@atlaskit/${ATLASKIT_PACKAGE_NAME}@${ATLASKIT_PACKAGE_VERSION}" -b "${GIT_BRANCH_NAME}"
    echo ">>> Listing atlaskit packages and version ..."
    echo "=============== Copy this content ===============";
    find packages -name "package.json" | xargs cat  | jq '.name+"@"+.version' | sort
    echo "=============== Copy this content ===============";
  fi;

  echo "All done!";
}
