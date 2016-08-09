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
log "Updating iterm schemes…"
git_repo https://github.com/mbadolato/iTerm2-Color-Schemes.git ~/.iterm-schemes

# ------------------------------------------------------------------------------
log "Installing Oh My Zsh…"
[ -d ~/.oh-my-zsh ] || (curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh)

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/willmendesneto/vhost.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/vhost
git clone git@github.com:paulirish/git-open.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/git-open

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
log "Cleaning up brew…"
brew linkapps
brew prune
brew cleanup --force -s

log "Add Git UP python package…"
pip install git-up
