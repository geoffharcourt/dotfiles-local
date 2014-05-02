""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUBY
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" additional vim-rspec mapping
nnoremap <Leader>a :call RunAllSpecs()<CR>
" Convert to 1.9 hash
nnoremap <Leader>: :ChangeHashSyntax
" Convert vim block format
let g:blockle_mapping = '<Leader>b'

" Add whitespace inside braces
nnoremap <Leader>{ :%s/{\([^ ]\)/{ \1/gc<CR>
nnoremap <Leader>} :%s/\([^ ]\)}/\1 }/gc<CR>

" Promote variable to Rspec let (also thanks Gary Bernhardt)
noremap <Leader>L :call PromoteToLet()<CR>

" Split long line with comma-separated terms into multiple lines, then indent
" the collection appropriately.
nnoremap <Leader>cs 0ma:s/,\s\=/,\r  /g<CR>mbg'a='b<CR>:nohlsearch<CR>

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

let g:syntastic_ruby_checkers = ['mri', 'rubylint', 'rubocop']
