"Essential plugins for programmers" 
call plug#begin()
Plug 'Valloric/YouCompleteMe'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips' 
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'suan/vim-instant-markdown'
call plug#end()
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

set hidden
syntax on
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'
set smartindent "A must to any programmer! "
set relativenumber
set ruler
set number
set foldmethod=marker "{{{ to begin fold, }}} to end fold. "
set foldclose=all
set smartcase "Awesome! "
set autowrite "saves after each command."
set undofile
set undodir=/home/mattemagikern/.nvimundo/
set ignorecase
set showmatch
"----- no bulk ---"
set tabstop=2 
set shiftwidth=2
set expandtab
"-----------------"
colorscheme elflord
"no backup files as swap"
set nobackup
set nowb
set noswapfile
"keybindings"
nnoremap nt :NERDTree<CR>
nnoremap , :nohl<CR>
nmap gb :Gblame<CR>
imap hh <Esc>
"fast save and exit"
map <C-x> :wq<CR>
map <C-a> :q<CR>
"quick serch, amazing for moving around in text files"
nnoremap <space> /
nnoremap <c-space> ?
