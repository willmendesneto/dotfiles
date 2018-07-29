#!/usr/bin/env bash
set -eu

log () {
  local fmt="» $1\n"; shift;
  tput setaf 2; printf "\n$fmt" "$@"; tput sgr0;
}

echo ""
echo "        _    _ _____ _      ___   ___  __  __  _____           "
echo "       | |  | |  ___| |    / __ \/ _ \|  \/  ||  ___|          "
echo "       | |/\| |  __|| |   | |  |_|  | | |\/| ||  __|           "
echo "       \  /\  / |___| |___| \__/\ \_/ | |  | || |___           "
echo "        \/  \/\____/\_____/\____/\___/\_|  |_/\____/           "
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
echo ">"
echo ">>"
echo ">>> Start the setup ..."

log "

This script is running using this configuration

Default Ruby Version: $DEFAULT_RUBY_VERSION
Default NodeJS Version: $DEFAULT_NODE_VERSION
Should skip 'brew cleanup' before run 'brew bundle'? : $SKIP_BREW_CLEANUP

"
# ------------------------------------------------------------------------------
log "Copying '.cli' folder"
rm -rf ~/.cli && cp -rf ~/dotfiles/.cli ~/.cli

# ------------------------------------------------------------------------------

log "Installing fonts"
git clone https://github.com/willmendesneto/font-library.git && cp -f ./font-library/**/*.{ttf,otf} ~/Library/Fonts && rm -rf font-library

log "Installing Oh My Zsh…"
[ -d ~/.oh-my-zsh ] || (curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh)

rm -rf ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/*

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/willmendesneto/vhost.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/vhost
git clone https://github.com/willmendesneto/frontend-search.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/frontend-search
git clone https://github.com/paulirish/git-open.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/git-open

log "Adding ZSH, VIM, GIT and RUBY GEM files into user root folder"
cp -f ~/dotfiles/.zshrc ~/.zshrc-old-dotfiles
cp -f ~/dotfiles/.zshenv ~/.zshenv-old-dotfiles
cp -f ~/dotfiles/.vimrc ~/.vimrc-old-dotfiles
cp -f ~/dotfiles/.gitconfig ~/.gitconfig-old-dotfiles
cp -f ~/dotfiles/.gemrc ~/.gemrc-old-dotfiles

rm -rf ~/.zshrc && cp -f ~/dotfiles/.zshrc ~/.zshrc
rm -rf ~/.zshenv && cp -f ~/dotfiles/.zshenv ~/.zshenv
rm -rf ~/.vimrc && cp -f ~/dotfiles/.vimrc ~/.vimrc
rm -rf ~/.gitconfig && cp -f ~/dotfiles/.gitconfig ~/.gitconfig
rm -rf ~/.gemrc && cp -f ~/dotfiles/.gemrc ~/.gemrc

echo "Oh My Zsh Downloaded. Please make sure that you added the plugins in your ~/.zshrc"

# ------------------------------------------------------------------------------
log "Installing NodeJS via NVM…"
[ -d ~/.nvm ] || (wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | sh)
. ~/.nvm/nvm.sh
nvm install $DEFAULT_NODE_VERSION
nvm use $DEFAULT_NODE_VERSION
nvm alias default $DEFAULT_NODE_VERSION

log "Installing Ruby via RVM…"
[ -d ~/.rvm ] || (curl -sSL https://get.rvm.io | bash)
. ~/.rvm/scripts/rvm
rvm install $DEFAULT_RUBY_VERSION
rvm use $DEFAULT_RUBY_VERSION --default

# ------------------------------------------------------------------------------
# log "Installing vim-plug…"
# curl -s -fLo ~/.vim/autoload/plug.vim --create-dirs \
#   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# ------------------------------------------------------------------------------

if [ "$SKIP_BREW_CLEANUP" == "true" ]
then
  log "Skipping Homebrew cleanup…"
else
  log "Cleaning up brew…"
  rm -rf ~/Brewfile && cp -rf ~/dotfiles/Brewfile ~/Brewfile
  brew linkapps
  brew prune
  brew cleanup --force -s
fi

log "Installing brew dependencies…"
brew update
brew bundle
rm -rf ~/Brewfile

log "Removing the cloned '~/dotfiles' repository"
rm -rf ~/dotfiles

log "Installing Redis Desktop Manager 'Medis'"
[ -d ~/medis ] || git clone https://github.com/luin/medis.git ~/medis
cd ~/medis
nvm install v7.10.1
nvm use v7.10.1
nvm alias default v7.10.1
npm install && npm run pack
cp -rf out/Medis-mas-x64/Medis.app /Applications/
cd ~ && rm -rf ~/medis
nvm use "$DEFAULT_NODE_VERSION"
nvm alias default "$DEFAULT_NODE_VERSION"