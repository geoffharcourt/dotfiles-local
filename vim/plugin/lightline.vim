let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night',
      \ 'active': {
      \   'left': [
      \             ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'myfilename', 'modified']
      \           ]
      \ },
      \ 'component': {
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
      \   'readonly': '%{(&filetype!="help" && &readonly) ? emoji#for("lock") : ""}',
      \ },
      \ 'component_function': {
      \   'myfilename': 'LightLineFilename',
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ }
\ }

function! LightLineFilename()
  let git_root = fnamemodify(fugitive#extract_git_dir(expand("%:p")), ":h")

  if expand("%:t") == ""
    return "[No Name]"
  elseif git_root != "" && git_root != "."
    return substitute(expand("%:p"), git_root . "/", "", "")
  else
    return expand("%:p")
  endif
endfunction
