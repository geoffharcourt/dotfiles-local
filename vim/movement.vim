" Up and down by visual lines, not literal lines
nnoremap gj j
nnoremap gk k
nnoremap j gj
nnoremap k gk
" Yank to end of line, like C, D
nnoremap Y y$

vnoremap gj j
vnoremap gk k
vnoremap j gj
vnoremap k gk

" Get dot command repeatability in visual mode
xnoremap . :normal.<CR>
