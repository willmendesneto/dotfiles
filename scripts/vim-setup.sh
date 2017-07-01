#!/usr/bin/env bash

# Downloads Vundle for manage plugins dependencies
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall
