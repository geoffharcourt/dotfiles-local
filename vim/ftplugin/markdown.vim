" Enable spellchecking
setlocal spell

" Automatically wrap at 80 characters
setlocal textwidth=80

nnoremap <buffer> <leader>sk :silent call search('\d', 'c')<cr>:SeekTimeInVLC <C-r><C-w><cr>
nnoremap <buffer> <leader>vt :silent InsertCurrntVLCTime<cr>
