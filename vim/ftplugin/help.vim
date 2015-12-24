setlocal nonumber

wincmd _ " Maximze the help on open

nnoremap <Buffer><Tab> :call search('\|.\{-}\|', 'w')<cr>:noh<cr>2l
nnoremap <Buffer><S-Tab> :call search('\|.\{-}\|', 'wb')<cr>:noh<cr>2l
nnoremap <Buffer><CR> <C-]>
nnoremap <Buffer>q :q<CR>
