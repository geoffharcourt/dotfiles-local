cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
