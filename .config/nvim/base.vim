set nocompatible
filetype on
filetype plugin on
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

"--- indentation and display --"
filetype plugin on
filetype indent on
set autoindent
set smartindent
set smarttab
set linebreak

set smartcase "Awesome! "
set foldmethod=marker "{{{ to begin fold, }}} to end fold. "

set undofile
set undodir=~/.nvimundo/
set ignorecase
set showmatch
"---colorscheme---"
colorscheme PaperColor 

"----- correct indentation---"
set tabstop=4
set shiftwidth=4
set noexpandtab

"no backup files as swap"
set nobackup
set nowb
set noswapfile

set inccommand=split
set listchars=eol:¬,space:·,tab:▸\
set list
set clipboard=unnamedplus
set autoread
