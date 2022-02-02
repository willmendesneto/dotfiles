/**
 * How to Use
 * nvm-install "$(cat .nvmrc)"
 *
 * or
 *
 * nvm-install <your-version-here>
 */

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
