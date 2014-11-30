" Get dot command repeatability in visual mode
xnoremap . :normal.<CR>

" Up and down by visual lines, not literal lines
nnoremap j gj
vnoremap j gj
nnoremap k gk
vnoremap k gk
nnoremap gj j
vnoremap gj j
nnoremap gk k
vnoremap gk k

" Yank to end of line, like C, D
nnoremap Y y$
