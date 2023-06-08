call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet'
Plug 'NLKNguyen/papercolor-theme'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'connorholyday/vim-snazzy'

Plug 'tpope/vim-fugitive'

Plug 'godlygeek/tabular'
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'


Plug 'haya14busa/vim-keeppad'

Plug 'gu-fan/riv.vim'

Plug 'arcticicestudio/nord-vim'
call plug#end()

let g:python3_host_prog = '/bin/python3'

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=1

"let s:brown = "905532"
"let s:aqua =  "3AFFDB"
"let s:blue = "689FB6"
"let s:darkBlue = "44788E"
"let s:purple = "834F79"
"let s:lightPurple = "834F79"
"let s:red = "AE403F"
"let s:beige = "F5C06F"
"let s:yellow = "F09F17"
"let s:orange = "D4843E"
"let s:darkOrange = "F16529"
"let s:pink = "CB6F6F"
"let s:salmon = "EE6E73"
"let s:green = "8FAA54"
"let s:lightGreen = "31B53E"
"let s:white = "FFFFFF"
"let s:rspec_red = 'FE405F'
"let s:git_orange = 'F54D27'

"set background=dark
"colo PaperColor

"let g:nord_cursor_line_number_background = 1
"let g:nord_uniform_diff_background = 1
"let g:nord_underline = 1
"colo nord

colorscheme snazzy
colorscheme challenger_deep

" fzf
let g:fzf_nvim_statusline = 0
let $FZF_DEFAULT_COMMAND = 'rg --files --no-ignore'

nnoremap <C-f> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-v': 'vsplit' }

