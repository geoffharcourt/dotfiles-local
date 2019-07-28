" Insert current file directory path (without file name)
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Get dot command repeatability in visual mode
xnoremap . :normal.<CR>

nnoremap \ :Find<Space>

" Override thoughtbot completion direction
inoremap <S-Tab> <C-P>

" Comment/un-comment like Sublime
nnoremap <C-\> :TComment<CR>
vnoremap <C-\> :TComment<CR>

" Complete from open tmux panes (from @junegunn)
inoremap <expr> <C-X><C-K> fzf#complete('cat /usr/share/dict/words')

" Rehighlight after moving text in visual mode
vnoremap < <gv
vnoremap > >gv

" Up and down by visual lines, not literal lines
nnoremap gj j
nnoremap gk k
nnoremap j gj
nnoremap k gk
vnoremap gj j
vnoremap gk k
vnoremap j gj
vnoremap k gk

" Bind K to grep word under cursor
nnoremap K :set nois<CR> :Find <C-R><C-W><CR>

" Re-select prior selection in visual mode
nnoremap gv `[v`]

vmap <silent> <expr> p paste#ReplaceVisualSelectionWithYankRegister()
nnoremap Q :echoe "Disabled Ex mode"<CR>

nnoremap U :echoe "Disabled lowercasing"<CR>
vnoremap U :echoe "Disabled lowercasing"<CR>

" Yank to end of line, like C, D
nnoremap Y y$

nnoremap <C-P> :Files<CR>

" additional vim-rspec mapping
nnoremap <Leader>a :TestSuite<CR>
nnoremap <Leader>f :TestLast --only-failures<CR>
" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
noremap <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
noremap <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>

" Split a string and move the portion after the next comma to the next line
noremap <Leader>cs 0ma:s/,\s\=/,\r  /g<CR>mbg'a='b<CR>:nohlsearch<CR>

nnoremap <Leader>g :SignifyToggle<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nnoremap <silent> <leader>d :call <SID>show_documentation()<CR>
nmap <silent> <leader>D <Plug>DashSearch

" LSP features
nnoremap <leader>k :call <SID>show_documentation()<CR>
nnoremap <leader>K :ALEGoToDefinition<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Fix indentation across file
nnoremap <Leader>i mmgg=G`m<CR>

nnoremap <Leader>o :call quickfix#ToggleLocationList()<CR>
nnoremap <Leader>m :w<CR>:Move <C-R>%
nnoremap <Leader>p "*p
nnoremap <Leader>q :call quickfix#ToggleQuickfixList()<CR>
nnoremap <Leader>r :redraw!<CR>
nnoremap <Leader>S :execute "Dispatch NO_HEADLESS=true rspec ". expand("%") .":". line(".")<CR>
vnoremap <Leader>y "*y
