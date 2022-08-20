"keybindings"
nnoremap nt :NERDTree<CR>
nnoremap , :nohl<CR>
nmap gb :Git blame<CR>
imap hh <Esc>
"fast save and exit"
map <C-x> :w<CR>
map <C-a> :q<CR>
"quick serch, amazing for moving around in text files"
let mapleader="\<Space>"
nnoremap <silent> <C-space> :BLines<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <C-b> :Buffers<CR>

"terminal"
tnoremap hh <C-\><C-N>

"autocmd BufRead,BufNewFile *.c,*.h set equalprg=astyle\ --mode=c

autocmd BufRead *.c,*.h,*.py,*.go set tw=110

au! BufRead,BufNewFile *.tex,*.md,*.rst,*COMMIT_EDITMSG set spell
"au! BufWritePre *.tex if &modified | call jobstart('make') | endif

nmap <Up>    <Nop>
nmap <Down>  <Nop>
nmap <Left>  <Nop>
nmap <Right> <Nop>

nnoremap Y y$
nnoremap Q @q

nnoremap <leader>w :e ~/wiki/index.rst <CR>

set wildchar=<Tab> wildmenu wildmode=full
noremap e<space> :e 
nnoremap <C-n> :bnext<CR>

nnoremap db :bd<CR>
