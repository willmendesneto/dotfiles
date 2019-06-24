#!/bin/bash
#
# Run Atlaskit build from a individual package
#
# How to use
#
# $ cd <your-sunbets-project>
# $ build-atlaskit-package (-f|--folder)
# 
# EX:
# build-atlaskit-package --folder=packages/core/global-navigation
#
function build-atlaskit-package() {

  ATLASKIT_PACKAGE_FOLDER=""

  for i in "$@"
  do
    case $i in
        -f=*|--folder=*)
        ATLASKIT_PACKAGE_FOLDER="${i#*=}"
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

  if [ "$ATLASKIT_PACKAGE_FOLDER" == "" ]; then
    echo "Please pass a name and a folder for the build command";
    echo "build-atlaskit-package (-f|--folder)";
    echo "";
    echo "EX:";
    echo "build-atlaskit-package --folder=packages/core/global-navigation";
    echo "";
  else
  
    echo "Running bundle for ${package} ..."

    echo ">>> Removing old bundle ..."
    rm -rf "${ATLASKIT_PACKAGE_FOLDER}/dist/{cjs,esm}"
    echo ">>> Starting bundle for CJS format ..."
    NODE_ENV=production BABEL_ENV=production:esm bolt workspaces exec --parallel --only-fs $ATLASKIT_PACKAGE_FOLDER -- babel src -d dist/esm --root-mode upward
    echo ">>> Starting bundle for ESM format ..."
    NODE_ENV=production BABEL_ENV=production:cjs bolt workspaces exec --parallel --only-fs $ATLASKIT_PACKAGE_FOLDER -- babel src -d dist/cjs --root-mode upward
  fi;

  echo "All done!";
}
