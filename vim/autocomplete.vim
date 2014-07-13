""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab key bullshit
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocomplete config
set complete=.,w,b,u,t,k,i
set wildmenu
set wildmode=longest:full,full
set completeopt=menuone,preview
set wildignore+=coverage
set infercase

" let g:ycm_min_num_of_chars_for_completion=5
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_complete_in_strings = 0

let g:UltiSnipsExpandTrigger="<c-b>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

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

" Unmapping this combination in favor of snippets
inoremap <S-Tab> <c-p>

function! SelectAutoCompleteOrCarriageReturn()
  if pumvisible()
    return "\<c-y>"
  else
    return "\<CR>"
  endif
endfunction

" Use escape to kill autocomplete without completion and stay in insert mode
inoremap <silent> <CR> <C-r>=SelectAutoCompleteOrCarriageReturn()<CR>

" autocmd FileType css,sass setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags

" Any autocomplete and Rails.vim do not play well together. Copied completion
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
