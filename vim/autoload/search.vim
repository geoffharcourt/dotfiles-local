" Combine the highlighting of vim-oblique and the search context of
" vim-indexed-search. See mappings in vim/after/zzzmappings.vim
function! search#AdvanceThroughResults()
  execute "silent normal \<Plug>(Oblique-n)"
  ShowSearchIndex
endfunction

function! search#GoBackThroughResults()
  execute "silent normal \<Plug>(Oblique-N)"
  ShowSearchIndex
endfunction
