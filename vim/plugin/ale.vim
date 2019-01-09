hi ALEVirtualTextInfo ctermfg=180 guifg=#e5c07b
hi ALEVirtualTextError ctermfg=168 ctermbg=17 gui=bold guifg=#e06c75 guibg=#3e4452
hi ALEVirtualTextStyleError ctermfg=168 ctermbg=17 gui=bold guifg=#e06c75 guibg=#3e4452
hi ALEVirtualTextStyleWarning ctermfg=180 guifg=#e5c07b
hi ALEVirtualTextWarning ctermfg=173 ctermbg=17 guifg=#d19a66 guibg=#3e4452

let g:ale_virtualtext_cursor=1
let g:ale_virtualtext_delay=500
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'ruby': ['rubocop', 'standardrb']
\}

let g:ale_linters_ignore = {
\  'javascript': ['tsserver'],
\  'ruby': ['reek']
\}
