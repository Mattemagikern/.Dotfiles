set nocompatible
filetype on
set encoding=UTF-8
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
Plug 'NLKNguyen/papercolor-theme'
Plug 'lervag/vimtex'
Plug 'Yilin-Yang/vim-markbar'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
call plug#end()

let g:python_host_prog = '/usr/bin/python2.7'
let g:python3_host_prog = '/usr/bin/python3.7'
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

let NERDTreeShowHidden=1
set inccommand=split
set listchars=eol:¬,space:·
"set list
"colo evening
au! BufRead,BufNewFile *.c,*.h,*.cpp set equalprg=astyle\ --mode=c
inoremap <> <><Left>
inoremap () ()<Left>
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap `` ``<Left>

nmap <Up>    <Nop>
nmap <Down>  <Nop>
nmap <Left>  <Nop>
nmap <Right> <Nop>

map $ <Nop>
map ^ <Nop>
map { <Nop>
map } <Nop>

noremap K     {
noremap J     }
noremap H     ^
noremap L     $

nnoremap Y y$

nnoremap Q @q

" you can add these colors to your .vimrc to help customizing
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

