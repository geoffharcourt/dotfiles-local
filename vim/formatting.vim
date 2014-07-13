" Indentation 
noremap <Leader>i mmgg=G`m<CR>

" don't use Ex mode, use Q for formatting
map Q gq

" Review markdown
command! Marked Dispatch open -a Marked.app %:p

" Spell check in markdown and text files
augroup spellingenabled
  autocmd!
  autocmd FileType markdown setlocal spell
  autocmd FileType markdown set complete+=kspell
  autocmd FileType text setlocal spell
  autocmd FileType text set complete+=kspell
augroup END
