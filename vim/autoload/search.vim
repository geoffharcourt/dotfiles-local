function! search#AdvanceThroughResults()
  execute "silent normal! \<Plug>(Oblique-n)"
  ShowSearchIndex
endfunction

function! search#GoBackThroughResults()
  execute "silent normal@ \<Plug>(Oblique-N)"
  ShowSearchIndex
endfunction
