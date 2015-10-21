""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Appearance
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set foldmethod=syntax
" Don't redraw the screen during macros
set lazyredraw
set nofoldenable
set nowrap
set number relativenumber
set scrolloff=5
" Don't try to highlight lines longer than 250 characters.
set synmaxcol=250

let g:netrw_liststyle= 4

let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:rainbow#colors = {
\   'dark': [
\     ['yellow',  'orange1'     ],
\     ['green',   'yellow1'     ],
\     ['cyan',    'greenyellow' ],
\     ['magenta', 'green1'      ],
\     ['red',     'springgreen1'],
\     ['yellow',  'cyan1'       ],
\     ['green',   'slateblue1'  ],
\     ['cyan',    'magenta1'    ],
\     ['magenta', 'purple1'     ]
\   ],
\   'light': [
\     ['darkyellow',  'orangered3'    ],
\     ['darkgreen',   'orange2'       ],
\     ['blue',        'yellow3'       ],
\     ['darkmagenta', 'olivedrab4'    ],
\     ['red',         'green4'        ],
\     ['darkyellow',  'paleturquoise3'],
\     ['darkgreen',   'deepskyblue4'  ],
\     ['blue',        'darkslateblue' ],
\     ['darkmagenta', 'darkviolet'    ]
\   ]
\ }

colorscheme jellybeans
" let g:airline_theme="jellybeans"

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

augroup rainbow
  autocmd BufRead,BufNewFile * RainbowParentheses
augroup END

" Show the current syntax block under the cursor
nmap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
  \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
  \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
