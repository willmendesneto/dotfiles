set nocompatible
set laststatus=2
set ruler
set relativenumber
syn on
set ttyfast
set mouse=a
set ttymouse=xterm2

set nobackup
set nowb
set noswapfile

set guifont=Monaco:h15
set cursorline
highlight CursorLine ctermbg=235
highlight CursorLineNR ctermbg=235 ctermfg=white

noremap  <Up>     <NOP>
inoremap <Down>   <NOP>
inoremap <Left>   <NOP>
inoremap <Right>  <NOP>
noremap  <Up>     <NOP>
noremap  <Down>   <NOP>
noremap  <Left>   <NOP>
noremap  <Right>  <NOP>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'ap/vim-css-color'
Plug 'Wutzara/vim-materialtheme'
call plug#end()

colorscheme materialtheme

map <C-d> :NERDTreeToggle<CR>
