" Up and down by visual lines, not literal lines
nnoremap j gj
vnoremap j gj
nnoremap k gk
vnoremap k gk
nnoremap gj j
vnoremap gj j
nnoremap gk k
vnoremap gk k

" Visually select the text that was last edited/pasted
nnoremap gV `[v`]

" Get dot command repeatability in visual mode
xnoremap . :normal.<CR>

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
