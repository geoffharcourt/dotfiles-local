" Convert vim block format
let g:blockle_mapping = '<Leader>b'

" additional vim-rspec mapping
nnoremap <Leader>a :call RunAllSpecs()<CR>

" Split long line with comma-separated terms into multiple lines, then indent
" the collection appropriately.
nnoremap <Leader>cs 0ma:s/,\s\=/,\r  /g<CR>mbg'a='b<CR>:nohlsearch<CR>

" nnoremap <Leader>ct :!./.git/hooks/ctags<CR>

" Can't use nnoremap here, see docs:
" http://vim-doc.herokuapp.com/view?https://raw.githubusercontent.com/rizzatti/dash.vim/master/doc/dash.txt
nmap <silent> <leader>d <Plug>DashSearch

nnoremap <Leader>gs :Gstatus<CR>
vnoremap <Leader>gb :Gblame<CR>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
noremap <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
noremap <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>
noremap <Leader>SP :vnew <C-R>=expand("%:p:h") . '/'<CR>

vnoremap <Leader>E :call ExtractVariable()<CR>
" temporarily stop search highlighting after search
nnoremap <Leader>h :nohlsearch<CR>

" Fix indentation across file
nnoremap <Leader>i mmgg=G`m<CR>

vnoremap <Leader>I :call InlineVariable()<CR>

nnoremap <Leader>j %!python -m json.tool<CR>

" nnoremap <Leader>k :call investigate#Investigate()<CR>

" http://robots.thoughtbot.com/faster-grepping-in-vim changed from the above blog post to use ag.vim hello
nnoremap <Leader>o :call ToggleLocationList()<CR>
nnoremap <Leader>L :call PromoteToLet()<CR>
nnoremap <Leader>M :Gmove <C-r>%
nnoremap <Leader>m :Move <C-r>%
nnoremap <Leader>M :call MergeTabs()<CR>
nnoremap <Leader>N :sp ~/Dropbox/notes/vim-notes.txt<CR>
nnoremap <Leader>n :call ToggleAutoComplete()<CR>
nnoremap <Leader>p :r!pbpaste<cr>
nnoremap <Leader>q :call ToggleQuickfixList()<CR>
nnoremap <Leader>R :source $MYVIMRC<CR>

nnoremap <Leader>u :GundoToggle<CR>

nnoremap <Leader>T :tabnew %<CR>

" Easier linewise reselection of what you just pasted.
nnoremap <Leader>V <C-w>v

nnoremap <Leader>w :w<CR>
vnoremap <Leader>y y:call ClipboardYank()<cr>

nnoremap <Leader><Tab> :Scratch<CR>
nnoremap <Leader>/ :call eregex#toggle()<CR>
