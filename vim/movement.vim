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

" Visually select the text that was last edited/pasted
nnoremap gV `[v`]

" Yank to end of line, like C, D
nnoremap Y y$

" Use tab to jump around matching surrounding chars
nnoremap <tab> %
vnoremap <tab> %
