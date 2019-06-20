let g:lightline = {
    \ 'colorscheme': 'one',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'cocstatus', 'readonly', 'conflicted', 'filename', 'modified' ] ],
    \   'right': [ [ 'percent', 'lineinfo' ] ,
    \              [ 'filetype' ] ]
    \ },
    \ 'component': {
    \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
    \ },
    \ 'component_function': {
    \   'cocstatus': 'coc#status',
    \   'conflicted': 'ConflictedVersion',
    \   'filename': 'LightlineFilename',
    \   'gitbranch': 'fugitive#head'
    \ },
    \ 'component_visible_condition': {
    \   'readonly': '(&filetype!="help"&& &readonly)',
    \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
    \ }
\ }

function! LightlineFilename()
  return expand('%:t') !=# '' ? pathshorten(expand('%')) : '[No Name]'
endfunction
