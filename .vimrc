call plug#begin('~/.vim/plugged')
    Plug 'pangloss/vim-javascript'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'altercation/vim-colors-solarized'
    Plug 'tpope/vim-vividchalk'
    Plug 'vim-syntastic/syntastic'
    Plug 'hail2u/vim-css3-syntax'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'tpope/vim-jdaddy'
    Plug 'othree/html5.vim'

call plug#end()

set sw=4
set et
set ts=4
set incsearch
set autoread
set background=dark
colorscheme vividchalk
syn on
set smarttab
filetype plugin indent on

