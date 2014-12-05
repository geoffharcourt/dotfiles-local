""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab key bullshit
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocomplete config
set complete=.,b,u,],k
set wildmenu
set wildmode=longest:full,full

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

function! SelectAutoCompleteOrCarriageReturn()
  if pumvisible()
    return "\<c-y>"
  else
    return "\<CR>"
  endif
endfunction

" Use escape to kill autocomplete without completion and stay in insert mode
inoremap <silent> <CR> <C-r>=SelectAutoCompleteOrCarriageReturn()<CR>

"" YouCompleteMe configuration
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_min_num_of_chars_for_completion = 4

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
