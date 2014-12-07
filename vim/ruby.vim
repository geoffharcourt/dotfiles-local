""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUBY
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_ruby_checkers = ['mri', 'rubylint']

" Treat files like Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,Guardfile,config.ru,*.rake} set ft=ruby

" Remove trailing whitespace on save for ruby files.
augroup rubywhitespace
  autocmd!
  au BufWritePre *.rb :%s/\s\+$//e
  au BufWritePre *.erb :%s/\s\+$//e
  au BufWritePre *.feature :%s/\s\+$//e
  au BufWritePre *.haml :%s/\s\+$//e
  au BufWritePre *.rake :%s/\s\+$//e
  au BufWritePre Gemfile :%s/\s\+$//e
augroup END

" autocmd FileType ruby set omnifunc=rubycomplete#Complete
" autocmd FileType ruby let g:rubycomplete_buffer_loading=1
" autocmd FileType ruby let g:rubycomplete_classes_in_global=1

if has("autocmd")
    " autocmd FileType ruby set omnifunc=syntaxcomplete#Complete
endif
