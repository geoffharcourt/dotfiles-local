""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab key bullshit
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocomplete config
set complete=.,w,b,u,t,k,i
set wildmenu
set wildmode=longest,list:longest
set completeopt=menuone,preview
set wildignore+=coverage
set infercase

" Override thoughtbot tab wrapper to move through autocomplete list
" in opposite direction
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-n>"
    endif
endfunction

inoremap <S-Tab> <C-p>

function! SelectAutoCompleteOrCarriageReturn()
  if pumvisible()
    return "\<C-y>"
  else
    return "\<CR>"
  endif
endfunction

" Use escape to kill autocomplete without completion and stay in insert mode
" inoremap <expr> <Esc> pumvisible() ? "\<C-y>" : "\<Esc>"
inoremap <CR> <C-r>=SelectAutoCompleteOrCarriageReturn()<CR>

autocmd FileType css,sass setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags

" Any autocomplete and Rails.vim do not play well together. Copied completion terms
" into custom dictionaries which are loaded when files with the right Rails
" classification (controller, model, template, etc.) are edited.
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
