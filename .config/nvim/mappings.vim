"keybindings"
nnoremap nt :NERDTree<CR>
nnoremap , :nohl<CR>
nmap gb :Git blame<CR>
imap hh <Esc>
"fast save and exit"
map <C-x> :w<CR>
"map <C-a> :q<CR>
"quick serch, amazing for moving around in text files"
let mapleader="\<Space>"
nnoremap <silent> <C-space> :BLines<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <C-b> :Buffers<CR>

nnoremap <silent> <C-a> :buffer term<TAB><CR>

"terminal"
tnoremap hh <Esc>
tnoremap <C-a> <C-\><C-N>

"autocmd BufRead,BufNewFile *.c,*.h set equalprg=astyle\ --mode=c

autocmd BufRead *.c,*.h,*.py,*.go,*.puml,*.md set tw=100

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

nnoremap <C-f> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-v': 'vsplit' }

nmap <ScrollWheelUp> <nop>
nmap <S-ScrollWheelUp> <nop>
nmap <C-ScrollWheelUp> <nop>
nmap <ScrollWheelDown> <nop>
nmap <S-ScrollWheelDown> <nop>
nmap <C-ScrollWheelDown> <nop>
nmap <ScrollWheelLeft> <nop>
nmap <S-ScrollWheelLeft> <nop>
nmap <C-ScrollWheelLeft> <nop>
nmap <ScrollWheelRight> <nop>
nmap <S-ScrollWheelRight> <nop>
nmap <C-ScrollWheelRight> <nop>
