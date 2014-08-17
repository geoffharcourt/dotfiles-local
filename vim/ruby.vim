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

" Autocomplete and Rails.vim do not play well together. Copied completion
" terms into custom dictionaries which are loaded when files with the right
" Rails classification (controller, model, template, etc.) are edited.
"
" This is a brutal, brutal hack.
augroup rubydictionaries
  autocmd!
  autocmd FileType erb,haml setlocal dictionary=~/.vim/dictionaries/ruby_template_completions
  autocmd BufEnter */controllers/*.rb setlocal dictionary=~/.vim/dictionaries/rails_controller_completions
  autocmd BufEnter */controllers/*/*.rb setlocal dictionary=~/.vim/dictionaries/rails_controller_completions
  autocmd BufEnter */db/migrate/*.rb setlocal dictionary=~/.vim/dictionaries/rails_migration_completions
  autocmd BufEnter */decorators/*.rb setlocal dictionary=~/.vim/dictionaries/ruby_template_completions
  autocmd BufEnter */helpers/*.rb setlocal dictionary=~/.vim/dictionaries/rails_template_completions
  autocmd BufEnter */mailers/*.rb setlocal dictionary=~/.vim/dictionaries/rails_mailer_completions
  autocmd BufEnter */models/*.rb setlocal dictionary=~/.vim/dictionaries/rails_model_completions
  autocmd BufEnter */spec/*/*.rb setlocal dictionary=~/.vim/dictionaries/rails_spec_completions
augroup END
