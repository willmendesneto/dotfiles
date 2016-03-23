#!/usr/bin/env bash
set -eu

echo ""
echo "        _    _ _____ _      ___   ___  __  __  _____ "
echo "       | |  | |  ___| |    / __ \/ _ \|  \/  ||  ___|"
echo "       | |/\| |  __|| |   | |  |_|  | | |\/| ||  __| "
echo "       \  /\  / |___| |___| \__/\ \_/ | |  | || |___ "
echo "        \/  \/\____/\_____/\____/\___/\_|  |_/\____/ "
echo ""
echo ""
echo ""
echo "                                                               "
echo "                        ,-----.                                "
echo "                      ,'_/_|_\_\`.                             "
echo "                     /<<::8[O]::>\                             "
echo "                    _|-----------|_                            "
echo "                :::|  | ====-=- |  |:::                        "
echo "                :::|  | -=-==== |  |:::                        "
echo "                :::\  | ::::|()||  /:::                        "
echo "                ::::| | ....|()|| |::::                        "
echo "                    | |_________| |                            "
echo "                    | |\_______/| |                            "
echo "                   /   \ /   \ /   \                           "
echo "                   \`---' \`---' \`---'                        "
echo ""
echo ""
echo ""
echo ""
echo ">"
echo ">>"
echo ">>> Start the setup ..."

log () {
  local fmt="» $1\n"; shift;
  tput setaf 2; printf "\n$fmt" "$@"; tput sgr0;
}

git_repo () {
  local src=$1; local dir=$2
  [ -d $dir/.git ] || git clone --recursive $src $dir
  pushd $dir
    git pull $src
    git submodule update --init --recursive
  popd
}

# ------------------------------------------------------------------------------

log "Linking Sublime Settings…"
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages
rm -rf ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
ln -sf ~/SpiderOak\ Hive/Sublime/User ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/

# ------------------------------------------------------------------------------
log "Updating iterm schemes…"
git_repo https://github.com/mbadolato/iTerm2-Color-Schemes.git ~/.iterm-schemes

# ------------------------------------------------------------------------------
log "Installing Oh My Zsh…"
[ -d ~/.oh-my-zsh ] || (curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh)

# ------------------------------------------------------------------------------
log "Installing latest ruby…"
TMP_RC=$(mktemp -t rcfile); cat << EOF > $TMP_RC
  LATEST_RUBY=\$(curl -s  https://raw.githubusercontent.com/postmodern/ruby-versions/master/ruby/versions.txt | sort | tail -n1)
  export RBENV_ROOT=/usr/local/var/rbenv
  eval "\$(rbenv init -)"

  rbenv install \$LATEST_RUBY --skip-existing
  rbenv global \$LATEST_RUBY

  rm -f $TMP_RC
EOF
zsh --rcs $TMP_RC
unset TMP_RC

# ------------------------------------------------------------------------------
log "Installing NodeJS…"
[ -d ~/.nvm ] || (wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | sh)

# ------------------------------------------------------------------------------
log "Setting up jenv…"
mkdir -p ~/.jenv/versions
for jdk in /Library/Java/JavaVirtualMachines/jdk1.*/Contents/Home; do
  jenv add $jdk
done

# ------------------------------------------------------------------------------
log "Installing vim-plug…"
curl -s -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# ------------------------------------------------------------------------------
log "Setting up docker-machine…"
machine_name=default
docker-machine ls | tail -n +2 | awk '{print $1}' | grep -q $machine_name || \
docker-machine create --driver virtualbox $machine_name
eval "$(docker-machine env default)"

# ------------------------------------------------------------------------------
log "Cleaning up brew…"
brew linkapps
brew prune
brew cleanup --force -s
