call plug#begin('~/.vim/plugged')
Plug 'connorholyday/vim-snazzy'
Plug 'itchyny/lightline.vim'
call plug#end()
" Enable syntax highlighting
syntax enable
set termguicolors
colorscheme snazzy

" Remove those pesky swap files
set nowb
set noswapfile

" Tabs and text
set wrap
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

" Search
set smartcase
set ignorecase
set incsearch
set hlsearch
set showmatch

" Remove sounds
set noerrorbells

" Line numbers
set relativenumber
set number

" Show file status
set ruler

" Light Line config
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }
