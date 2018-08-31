"----Essential plugins-----
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'suan/vim-instant-markdown'
Plug 'NLKNguyen/papercolor-theme'
call plug#end()

set hidden
"---Syntax && wirting------
syntax on
set smartindent "A must to any programmer! "
set autoindent
set smartcase "Awesome! "
set autoindent
set showmatch
set wrap
set lbr
set tw=500
colorscheme elflord
"-----Location----
set ruler
set number
set relativenumber
"-----Folding---
set foldmethod=marker "{{{ to begin fold, }}} to end fold. "
set foldclose=all
"----- undofile----
set undofile
set undodir=/home/mattemagikern/.vimundo/
"----- No bulk ---"
set tabstop=2 
set shiftwidth=2
set expandtab
"------No backup files as swap-------
set nobackup
set nowb
set noswapfile
"--------Keybindings---------
nnoremap nt :NERDTree<CR>
nnoremap , :nohl<CR>
nmap gb :Gblame<CR>
imap hh <Esc>
"-----Fast save and exit------"
map <C-x> :w<CR>
map <C-a> :q<CR>
"Quick serch, amazing for moving around in text files"
nnoremap <space> /
nnoremap <c-space> ?
set ignorecase
set hlsearch
hi Search guibg=LightBlue
set tw=80
colo morning
