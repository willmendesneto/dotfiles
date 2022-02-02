# Installs NodeJS version and adds it as default in your OS using NVM
#
# How to Use
#
# $ nvm-install "$(cat .nvmrc)"
#
# or
#
# $ nvm-install <node-version>
#

function nvm-install() {
  if [[ -n "$1" ]]; then
    echo "Installing NodeJS ${1} ..."
    nvm install "$1";
    nvm use "$1";
    nvm alias default "$1";
    echo "NodeJS ${1} installed!"
  else
    echo "proper usage: nvm-install <node-version>."
  fi
}
