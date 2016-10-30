setlocal nonumber

wincmd _ " Maximze the help on open

nnoremap <Buffer><Tab> :call search('\|.\{-}\|', 'w')<CR>:noh<CR>2l
nnoremap <Buffer><S-Tab> :call search('\|.\{-}\|', 'wb')<CR>:noh<CR>2l
nnoremap <Buffer><CR> <C-]>
nnoremap <Buffer>q :q<CR>
