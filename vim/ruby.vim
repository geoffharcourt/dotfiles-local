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
