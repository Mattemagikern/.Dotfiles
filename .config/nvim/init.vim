set nocompatible
filetype off
set encoding=utf8
set hidden
syntax on
set t_Co=256
filetype plugin on

call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'tpope/vim-fugitive'
Plug 'suan/vim-instant-markdown'
Plug 'iCyMind/NeoSolarized'
Plug 'whatyouhide/vim-gotham'
Plug 'NLKNguyen/papercolor-theme'
call plug#end()

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'
call remote#host#RegisterPlugin('python3', '~/.config/nvim/plugged/deoplete.nvim/rplugin/python3/deoplete/deoplete.py', [
		\ {'sync': 1, 'name': 'DeopleteInitializePython', 'type': 'command', 'opts': {}},
			\ ])
call deoplete#enable()
let g:neosnippet#enable_snipmate_compatibility = 1
imap <C-u>     <Plug>(neosnippet_expand_or_jump)
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
if !exists('g:deoplete#omni#input_patterns')
	let g:deoplete#omni#input_patterns = {}
endif
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'


set number                     " Enable line numbers
set backspace=indent,eol,start " Allow backspace in Insert mode
set showmode                   " Show current mode
set gcr=a:blinkon0             " Disable cursor blink
set autoread                   " Reload files changed outside vim
set laststatus=2               " Always show status line
set splitright                 " Opens vertical split right of current window
set splitbelow                 " Opens horizontal split below current window

"--- indentation and display --"
filetype plugin on
filetype indent on
set autoindent
set smartindent
set smarttab
set linebreak
set textwidth=79

set smartcase "Awesome! "
set foldmethod=marker "{{{ to begin fold, }}} to end fold. "

set undofile
set undodir=~/.nvimundo/
set ignorecase
set showmatch
"---colorscheme---"
"colorscheme NeoSolarized
"colorscheme gotham
colorscheme PaperColor
"----- correct indentation---"
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
"-----------------"
"
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
map <C-x> :w<CR>
map <C-a> :q<CR>
"quick serch, amazing for moving around in text files"
nnoremap <space> /
nnoremap <c-space> ?

"set hidden
let g:NERDTreeWinPos = "right"

"terminal"
tnoremap hh <C-\><C-N>
"haskell"
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
      \ 'haskell': ['hie', '--lsp'],
\ }

set inccommand=split
set listchars=eol:¬,space:·
"set list
"colo evening

" Git Gutter"
set signcolumn=yes

let g:gitgutter_sign_added = '-'
let g:gitgutter_sign_modified = '-'

hi GitGutterAdd ctermfg=green
hi GitGutterChange ctermfg=yellow
hi GitGutterDelete ctermbg=red
hi GitGutterChangeDelete ctermbg=red
