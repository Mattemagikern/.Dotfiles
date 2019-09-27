set nocompatible
filetype on
set rtp+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

set t_Co=256

set encoding=UTF-8
syntax on


set number                     " Enable line numbers
set backspace=indent,eol,start " Allow backspace in Insert mode
set autoread                   " Reload files changed outside vim
set laststatus=0               " Never show status line
set splitright                 " Opens vertical split right of current window
set splitbelow                 " Opens horizontal split below current window


filetype plugin on
filetype indent on
set autoindent
set smartindent
set smarttab
set linebreak

set smartcase "Awesome! "
set foldmethod=marker

set undofile
set undodir=~/.nvimundo/
set ignorecase
set showmatch

set tabstop=4
set shiftwidth=4
set noexpandtab

set hidden

set nobackup
set nowb
set noswapfile

set inccommand=split
set listchars=eol:¬,space:·,tab:▸\
set list
set clipboard=unnamedplus
set autoread

autocmd BufRead,BufNewFile *.h set filetype=h syntax=c

let g:netrw_winsize = 25
let g:netrw_banner = 0
let g:netrw_linestyle = 3
let g:netrw_altv = 0

let g:netrw_browse_split = 4
