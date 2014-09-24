" Convert vim block format
let g:blockle_mapping = '<Leader>b'

" additional vim-rspec mapping
nnoremap <Leader>a :call RunAllSpecs()<CR>

nnoremap <Leader>C :PluginClean<CR>

" Split long line with comma-separated terms into multiple lines, then indent
" the collection appropriately.
nnoremap <Leader>cs 0ma:s/,\s\=/,\r  /g<CR>mbg'a='b<CR>:nohlsearch<CR>
nnoremap <Leader>ct :!.git/hooks/ctags<CR>
nnoremap <silent> <Leader>d <Plug>DashGlobalSearch
nnoremap <Leader>gs :Gstatus<CR>
vnoremap <Leader>gb :Gblame<CR>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
noremap <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
noremap <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>
noremap <Leader>SP :vnew <C-R>=expand("%:p:h") . '/'<CR>

" temporarily stop search highlighting after search
nnoremap <Leader>h :nohlsearch<CR>

" Fix indentation across file
nnoremap <Leader>i mmgg=G`m<CR>

nnoremap <Leader>j :Dispatch spring teaspoon % <CR>
nnoremap <Leader>J :Dispatch spring teaspoon <CR>

" http://robots.thoughtbot.com/faster-grepping-in-vim
" changed from the above blog post to use ag.vim
nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <Leader>o :call ToggleLocationList()<CR>
nnoremap <Leader>L :call PromoteToLet()<CR>
nnoremap <Leader>m :Move <C-r>%
nnoremap <Leader>n :sp ~/Dropbox/notes/vim-notes.txt<CR>
nnoremap <Leader>p :r!pbpaste<cr>
nnoremap <Leader>R :call PromoteToLet()
nnoremap <Leader>q :call ToggleQuickfixList()<CR>
nnoremap <Leader>S :source $MYVIMRC<CR>
nnoremap <Leader>U :PluginUpdate<CR>

" Easier linewise reselection of what you just pasted.
nnoremap <Leader>V V`]
nnoremap <Leader>w :tabnext<CR>
vnoremap <Leader>x x:call ClipboardYank()<cr>
vnoremap <Leader>y y:call ClipboardYank()<cr>

" Add whitespace inside braces
nnoremap <Leader>{ :%s/{\([^ ]\)/{ \1/gc<CR>
nnoremap <Leader>} :%s/\([^ ]\)}/\1 }/gc<CR>

" Open scratch pad
nnoremap <Leader><Tab> :Scratch<CR>
