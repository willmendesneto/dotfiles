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
log "Copying .cli folder"
rm -rf ~/.cli && cp -r ~/.cider/symlinks/.cli ~/.cli

# ------------------------------------------------------------------------------

log "Installing fonts"
git clone https://github.com/willmendesneto/font-library.git && cp ./font-library/**/*.{ttf,otf} ~/Library/Fonts && rm -rf font-library

log "Installing Oh My Zsh…"
[ -d ~/.oh-my-zsh ] || (curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh)

rm -rf ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/*

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/willmendesneto/vhost.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/vhost
git clone https://github.com/willmendesneto/frontend-search.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/frontend-search
git clone https://github.com/paulirish/git-open.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/git-open

log "Creating links"
rm -rf ~/.zshrc && ln -s ~/.cider/symlinks/.zshrc ~/.zshrc

echo "Oh My Zsh Downloaded. Please make sure that you added the plugins in your ~/.zshrc"
echo "plugins=(zsh-syntax-highlighting zsh-autosuggestions vhost frontend-search git-open)"

# ------------------------------------------------------------------------------
log "Installing NodeJS…"
[ -d ~/.nvm ] || (wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | sh)


# ------------------------------------------------------------------------------
log "Installing vim-plug…"
curl -s -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# ------------------------------------------------------------------------------
log "Cleaning up brew…"
brew linkapps
brew prune
brew cleanup --force -s
