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

if [ "$SKIP_BREW_CLEANUP" == "true" ]
then
  log "Skipping Homebrew cleanup…"
else
  log "Cleaning up brew…"
  rm -rf ~/Brewfile && cp -rf ~/dotfiles/Brewfile ~/Brewfile
  brew cleanup -s
fi

log "Installing brew dependencies…"
brew update
brew bundle
rm -rf ~/Brewfile

# ------------------------------------------------------------------------------
log "Copying '.cli' folder"
rm -rf ~/.cli && cp -rf ~/dotfiles/.cli ~/.cli

# ------------------------------------------------------------------------------

log "Installing fonts"
git clone https://github.com/willmendesneto/font-library.git && cp -f ./font-library/**/*.{ttf,otf} ~/Library/Fonts && rm -rf font-library

log "Installing Oh My Zsh…"
[ -d ~/.oh-my-zsh ] || (curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh)

rm -rf ~/.oh-my-zsh/custom/plugins/*

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/willmendesneto/vhost.git ~/.oh-my-zsh/custom/plugins/vhost
git clone https://github.com/willmendesneto/frontend-search.git ~/.oh-my-zsh/custom/plugins/frontend-search
git clone https://github.com/paulirish/git-open.git ~/.oh-my-zsh/custom/plugins/git-open

log "Installing 'Hyper-Oh-My-ZSH' theme"
mkdir -p ~/.oh-my-zsh/custom/themes && wget -O ~/.oh-my-zsh/custom/themes/hyper-oh-my-zsh.zsh-theme https://raw.githubusercontent.com/willmendesneto/hyper-oh-my-zsh/master/hyper-oh-my-zsh.zsh-theme

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

# ------------------------------------------------------------------------------
# log "Installing vim-plug…"
# curl -s -fLo ~/.vim/autoload/plug.vim --create-dirs \
#   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# ------------------------------------------------------------------------------
log "Removing the cloned '~/dotfiles' repository"
rm -rf ~/dotfiles
