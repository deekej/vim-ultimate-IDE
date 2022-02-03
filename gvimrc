" Maximimize the gVim window for 21:9 / 1440p monitor size:
autocmd Syntax * if &filetype !=# 'gitcommit' && &filetype !=# 'gitrebase' | set lines=52 columns=300 | endif
autocmd Syntax * if &filetype ==# 'gitcommit' || &filetype ==# 'gitrebase' | set lines=52 columns=120 | endif

" NOTE: Using the 'Syntax' keyword here, because processing of the commands
"       above is much faster then using typical 'BufEnter' or 'VimEnter'.
"  See: https://vi.stackexchange.com/questions/4493/what-is-the-order-of-winenter-bufenter-bufread-syntax-filetype-events

" Set wider sub-window sizes for NERDTree & Tagbar:
let g:NERDTreeWinSize = 80                " Sets the width of NERDTree column.
let g:tagbar_width = 45                   " Sets the width of Tagbar column.
