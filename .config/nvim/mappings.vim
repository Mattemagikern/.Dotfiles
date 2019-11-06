"keybindings"
nnoremap nt :NERDTree<CR>
nnoremap , :nohl<CR>
nmap gb :Gblame<CR>
imap hh <Esc>
"fast save and exit"
map <C-x> :w<CR>
map <C-a> :q<CR>
"quick serch, amazing for moving around in text files"
let mapleader="\<Space>"
nnoremap <space> /
nnoremap <c-space> ?

"terminal"
tnoremap hh <C-\><C-N>

autocmd BufRead,BufNewFile *.c,*.h set equalprg=astyle\ --mode=c

autocmd BufRead *.c,*.h,*.py,*.go set tw=79

au! BufRead,BufNewFile *.tex,*.md set spell
au! BufWritePre *.tex if &modified | call jobstart('make') | endif

" inoremap <> <><Left>
" inoremap () ()<Left>
" inoremap {} {}<Left>
" inoremap [] []<Left>
" inoremap "" ""<Left>
" inoremap '' ''<Left>
" inoremap `` ``<Left>

nmap <Up>    <Nop>
nmap <Down>  <Nop>
nmap <Left>  <Nop>
nmap <Right> <Nop>

nnoremap Y y$
nnoremap Q @q

set wildchar=<Tab> wildmenu wildmode=full
noremap sw :b 
noremap e<space> :e 
nnoremap <C-n> :bnext<CR>
