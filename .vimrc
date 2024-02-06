call plug#begin('~/.config/nvim/plugged')
    Plug 'pangloss/vim-javascript'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'altercation/vim-colors-solarized'
    Plug 'tpope/vim-vividchalk'
    Plug 'hail2u/vim-css3-syntax'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'tpope/vim-jdaddy'
    Plug 'othree/html5.vim'
    Plug 'dense-analysis/ale'
call plug#end()

set mouse=a
set sw=4
set et
set ts=4
set bs=2
set incsearch
set hlsearch
set autoread
set background=dark
set termguicolors
colorscheme vividchalk
syn on
set smarttab
filetype plugin indent on

let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {'javascript': ['prettier', 'eslint']}
