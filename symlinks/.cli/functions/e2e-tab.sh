#
# Run the e2e tests for tab
#
# How to use
#
# $ cd <your-tab-project>
# $ e2e-tab (-n|--no-link) (-w|--web-parts=web-parts-folder) (-d|--dir=www-tab-folder)
#
# Optional values
#
# -n | --no-link      If you don't like to create a link from web-parts locally
# -d | --dir          `www-tab` local directory
# -w | --web-parts    `web-parts` local directory

function e2e-tab() {

  NVM_CREATE_LINK=true
  PROJECT_DIRECTORY="../www-tab"
  WEB_PARTS_DIRECTORY="../web-parts"

  for i in "$@"
  do
    case $i in
        -w=*|--web-parts=*)
        WEB_PARTS_DIRECTORY="${i#*=}"
        shift # past argument=value
        ;;
        -d=*|--dir=*)
        PROJECT_DIRECTORY="${i#*=}"
        shift # past argument=value
        ;;
        -n=*|--no-link=*)
        NVM_CREATE_LINK="${i#*=}"
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

  cd "$WEB_PARTS_DIRECTORY";
  nvm use;

  # Creating a npm link in web-parts
  if [ $NVM_CREATE_LINK = true ]; then
    echo "Creating a Web Parts NPM Link locally ...";
    npm link;
  fi

  cd "$PROJECT_DIRECTORY";

  if [ -s "app/scripts/configuration.js" ]; then
    echo "Creating a cache with oldest `configuration.js` file ...";
    cp -f app/scripts/configuration.js app/scripts/configuration.old.js;
  fi

  cp app/scripts/configuration.ci.js app/scripts/configuration.js;

  # Add web-parts link in the project
  if [ $NVM_CREATE_LINK = true ]; then
    echo "Creating Web Parts NPM Link locally from Sunbets ...";
    npm link web-parts;
  fi

  # Run the tests
  ./node_modules/.bin/grunt e2e;

  if [ -s "app/scripts/configuration.old.js" ]; then
    echo "Replacing configuration with oldest `configuration.js` file ...";
    cp -f app/scripts/configuration.old.js app/scripts/configuration.js;
  fi

  if [ $NVM_CREATE_LINK = true ]; then
    echo "Removing Web Parts NPM Link locally from Sunbets ...";
    npm unlink web-parts;
  fi

  echo "All done!";
}
