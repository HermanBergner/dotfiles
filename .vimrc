call plug#begin('~/.vim/plugged')
Plug 'connorholyday/vim-snazzy'
Plug 'https://github.com/scrooloose/nerdtree.git'
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
let g:lightline = { 'colorscheme': 'one' }

let mapleader = ","

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
nmap <leader>ne :NERDTree<cr>
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden=1
