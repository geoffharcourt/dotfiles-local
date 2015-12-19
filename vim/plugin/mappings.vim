cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Get dot command repeatability in visual mode
xnoremap . :normal.<CR>

nnoremap \ :Ag<SPACE>

" Use escape to kill autocomplete without completion and stay in insert mode
inoremap <silent> <Esc> <C-r>=autocomplete#CancelAutoCompleteOrInsertMode()<CR>

" Enter selects the winner if autocompletion popup is open
inoremap <silent> <CR> <C-r>=autocomplete#SelectAutoCompleteOrCarriageReturn()<CR>

" Override thoughtbot completion direction
inoremap <S-Tab> <C-p>

" Comment/un-comment like Sublime
nnoremap <C-\> :TComment<CR>
vnoremap <C-\> :TComment<CR>

" Complete from open tmux panes (from @junegunn)
inoremap <expr> <C-x><C-t> fzf#complete('tmuxwords.rb --all-but-current --scroll 499 --min 5')
inoremap <expr> <C-x><C-k> fzf#complete('cat /usr/share/dict/words')

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

nmap gJ :SplitjoinJoin<CR>
nmap gS :SplitjoinSplit<CR>

" Bind K to grep word under cursor
nnoremap K :set nois<CR> :StaticAg <C-R><C-W><CR>

nnoremap gv `[v`]

vmap <silent> <expr> p paste#ReplaceVisualSelectionWithYankRegister()
nnoremap Q :echoe "Disabled Ex mode"<CR>

" Yank to end of line, like C, D
nnoremap Y y$

" Re-select prior selection in visual mode
nnoremap <C-p> :Files<CR>

nnoremap <Leader>/ :call eregex#toggle()<CR>

" additional vim-rspec mapping
nnoremap <Leader>a :call RunAllSpecs()<CR>
nnoremap <Leader>d Orequire 'pry'; binding.pry<Esc>:w<CR>
" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
noremap <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
noremap <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>

" temporarily stop search highlighting after search
nnoremap <Leader>h :nohlsearch<CR>

" Fix indentation across file
nnoremap <Leader>i mmgg=G`m<CR>

" http://robots.thoughtbot.com/faster-grepping-in-vim changed from the above blog post to use ag.vim hello
nnoremap <Leader>o :call quickfix#ToggleLocationList()<CR>
nnoremap <Leader>l :call rspec#PromoteToLet()<CR>
nnoremap <Leader>m :Move <C-r>%
nnoremap <Leader>M :call tabs#MergeTabs()<CR>
nnoremap <Leader>n :sp ~/Dropbox/notes/vim-notes.txt<CR>
nnoremap <Leader>p "+p
nnoremap <Leader>q :call quickfix#ToggleQuickfixList()<CR>
vnoremap <Leader>y y:call yank#YankToOSXClipboard()<cr>
