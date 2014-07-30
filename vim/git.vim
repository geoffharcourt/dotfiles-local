""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <Leader>gs :Gstatus<CR>
" Git blame!
vnoremap <Leader>gb :Gblame<CR>

" Use spellcheck in git commits.
autocmd FileType gitcommit setlocal spell
autocmd FileType gitcommit set complete+=kspell
