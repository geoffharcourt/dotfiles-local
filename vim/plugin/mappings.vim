cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Get dot command repeatability in visual mode
xnoremap . :normal.<CR>

nnoremap \ :Ag<CR>

" Use escape to kill autocomplete without completion and stay in insert mode
inoremap <silent> <Esc> <C-R>=autocomplete#CancelAutoCompleteOrInsertMode()<CR>

" Enter selects the winner if autocompletion popup is open
inoremap <silent> <CR> <C-R>=autocomplete#SelectAutoCompleteOrCarriageReturn()<CR>

" Override thoughtbot completion direction
inoremap <S-Tab> <C-P>

" Comment/un-comment like Sublime
nnoremap <C-\> :TComment<CR>
vnoremap <C-\> :TComment<CR>

" Complete from open tmux panes (from @junegunn)
inoremap <expr> <C-X><C-T> fzf#complete('tmuxwords.rb --all-but-current --scroll 499 --min 5')
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
nnoremap K :set nois<CR> :StaticAg <C-R><C-W><CR>

nnoremap gv `[v`]

vmap <silent> <expr> p paste#ReplaceVisualSelectionWithYankRegister()
nnoremap Q :echoe "Disabled Ex mode"<CR>

nnoremap U :echoe "Disabled lowercasing"<CR>
vnoremap U :echoe "Disabled lowercasing"<CR>

" Yank to end of line, like C, D
nnoremap Y y$

" Re-select prior selection in visual mode
nnoremap <C-P> :Files<CR>

" additional vim-rspec mapping
nnoremap <Leader>a :TestSuite<CR>
" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
noremap <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
noremap <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>

" Split a string and move the portion after the next comma to the next line
noremap <Leader>cs 0ma:s/,\s\=/,\r  /g<CR>mbg'a='b<CR>:nohlsearch<CR>

" temporarily stop search highlighting after search
nnoremap <Leader>h :nohlsearch<CR>

" Fix indentation across file
nnoremap <Leader>i mmgg=G`m<CR>

" http://robots.thoughtbot.com/faster-grepping-in-vim changed from the above blog post to use ag.vim hello
nnoremap <Leader>o :call quickfix#ToggleLocationList()<CR>
nnoremap <Leader>m :w<CR>:Move <C-R>%
nnoremap <Leader>p cv
nnoremap <Leader>q :call quickfix#ToggleQuickfixList()<CR>
vnoremap <Leader>y cp
