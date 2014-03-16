set ttimeout
set ttimeoutlen=1

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

" Suddenly arrows stopped working in Insert mode, enough of that bullshit.
inoremap <ESC>oA <ESC>ki
inoremap <ESC>oB <ESC>ji
inoremap <ESC>oC <ESC>li
inoremap <ESC>oD <ESC>hi

" Get dot command repeatability in visual mode
xnoremap . :normal.<CR>
