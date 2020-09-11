call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet'
Plug 'NLKNguyen/papercolor-theme'

Plug 'tpope/vim-fugitive'

"Plug 'vimwiki/vimwiki'
Plug 'godlygeek/tabular'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'


Plug 'haya14busa/vim-keeppad'

Plug 'gu-fan/riv.vim'
call plug#end()

let g:python3_host_prog = '/bin/python3'

call remote#host#RegisterPlugin('python3', '~/.config/nvim/plugged/deoplete.nvim/rplugin/python3/deoplete/deoplete.py', [
			\ {'sync': 1, 'name': 'DeopleteInitializePython', 'type': 'command', 'opts': {}},
			\ ])
call deoplete#enable()

let g:neosnippet#snippets_directory="~/.config/nvim/snippets"
let g:neosnippet#disable_runtime_snippets = { "_": 1, }
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
imap <C-u> <Plug>(neosnippet_expand_or_jump)

let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=1


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


let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

set background=light
colo PaperColor

" fzf
let g:fzf_nvim_statusline = 0
let $FZF_DEFAULT_COMMAND = 'rg --files'
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <C-p> :Buffers<CR>
