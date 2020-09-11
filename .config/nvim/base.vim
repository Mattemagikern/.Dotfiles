syntax on
set t_Co=256

set encoding=UTF-8
set nonumber                   " Disable line numbers
set backspace=indent,eol,start " Allow backspace in Insert mode
set autoread                   " Reload files changed outside vim
set laststatus=0               " Never show status line
set splitright                 " Opens vertical split right of current window
set splitbelow                 " Opens horizontal split below current window

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


set tabstop=8
set shiftwidth=8

set hidden

set nobackup
set nowb
set noswapfile

set inccommand=split

set listchars=space:·,tab:▸\
set nolist

set clipboard=unnamedplus
set autoread

autocmd BufRead,BufNewFile *.h set filetype=h syntax=c
autocmd BufWritePre *.c,*.h,*.md,*.config,*.txt,*.yml,*.sh,*.rst %s/\s\+$//e
set guicursor=


au BufWinEnter *.c,*.h let w:m1=matchadd('Search', '\%<82v.\%>81v', -1)
au BufWinEnter *.c,*.h let w:m2=matchadd('ErrorMsg', '\%>81v.\+', -1)

"au BufRead,BufNewFile *.h,*.c set tabstop=8 shiftwidth=8 expandtab
au BufRead,BufNewFile *.yml,*.yaml set tabstop=4 shiftwidth=4 expandtab
