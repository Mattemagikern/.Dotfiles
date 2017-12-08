"Essential plugins for programmers" 
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'tpope/vim-fugitive'
Plug 'suan/vim-instant-markdown'
Plug 'Shougo/echodoc.vim'
Plug 'iCyMind/NeoSolarized'
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
set undofile
set undodir=~/.nvimundo/
set ignorecase
set showmatch
"---colorscheme---
colorscheme NeoSolarized
set background=dark
set termguicolors
"----- no bulk ---"
set tabstop=2 
set shiftwidth=2
set expandtab
"-----------------"
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

set hidden
" Automatically start language servers.
let g:LanguageClient_autoStart = 1
set tw=78
let g:NERDTreeWinPos = "right"
set clipboard=unnamedplus

"terminal"
tnoremap hh <C-\><C-N>

:set inccommand=split
