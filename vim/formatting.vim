" Indentation 
noremap <Leader>i mmgg=G`m<CR>

" don't use Ex mode, use Q for formatting
map Q gq

nnoremap <Leader>ra :SyntasticCheck <CR>
nnoremap <Leader>ri :SyntasticCheck mri<CR>
nnoremap <Leader>rl :SyntasticCheck rubylint<CR>
nnoremap <Leader>ru :SyntasticCheck rubocop<CR>

" Spell check in markdown and text files
augroup spellingenabled
  autocmd!
  autocmd FileType markdown setlocal spell
  autocmd FileType markdown set complete+=kspell
  autocmd FileType text setlocal spell
  autocmd FileType text set complete+=kspell
augroup END

