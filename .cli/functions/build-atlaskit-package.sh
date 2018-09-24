#
# Run Atlaskit build from a individual package
#
# How to use
#
# $ cd <your-sunbets-project>
# $ build-atlaskit-package (-n|--name) (-f|--folder)
# 
# EX:
# build-atlaskit-package --name=global-navigation --folder=packages/core/global-navigation
#
function build-atlaskit-package() {

  ATLASKIT_PACKAGE_FOLDER=""
  ATLASKIT_PACKAGE_NAME=""

  for i in "$@"
  do
    case $i in
        -f=*|--folder=*)
        ATLASKIT_PACKAGE_FOLDER="${i#*=}"
        shift # past argument=value
        ;;
        -n=*|--name=*)
        ATLASKIT_PACKAGE_NAME="${i#*=}"
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

  if [ "$ATLASKIT_PACKAGE_FOLDER" == "" ] || [ "$ATLASKIT_PACKAGE_NAME" == "" ]; then
    echo "Please pass a name and a folder for the build command";
    echo "build-atlaskit-package (-n|--name) (-f|--folder)";
    echo "";
    echo "EX:";
    echo "build-atlaskit-package --name=global-navigation --folder=packages/core/global-navigation";
    echo "";
  else
  
    package=@atlaskit/$ATLASKIT_PACKAGE_NAME

    echo "Running bundle for ${package} ..."

    echo ">>> Removing old bundle ..."
    rm -rf "${ATLASKIT_PACKAGE_FOLDER}/dist/{cjs,esm}"
    echo ">>> Starting bundle for CJS and ESM format ..."
    NODE_ENV=production BABEL_ENV=production:cjs bolt workspaces exec --only $package -- babel src -d dist/cjs
    echo ">>> Starting bundle for ESM format ..."
    NODE_ENV=production BABEL_ENV=production:esm bolt workspaces exec --only "$package" -- babel src -d dist/esm 
  fi;

  echo "All done!";
}
