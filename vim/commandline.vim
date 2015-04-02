cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

nnoremap Q :echoe "Disabled Ex mode"<CR>
