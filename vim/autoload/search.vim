function! search#AdvanceThroughResults()
  " execute "silent normal! \<Plug>(Oblique-n)"
  normal! n
  ShowSearchIndex
endfunction

function! search#GoBackThroughResults()
  " execute "silent normal! \<Plug>(Oblique-N)"
  normal! N
  ShowSearchIndex
endfunction
