" =============================================================================
" General GUI configuration:
" =============================================================================
" Font used for GUI only (Vim/nVim inherits font settings from the terminal):
set guifont=Hack\ Nerd\ Font\ 12

" Supported Nerd Font alternative:
"set guifont=DejaVuSansMono\ Nerd\ Font\ 12

" Maximimize the gVim window for 21:9 / 1440p monitor size:
autocmd Syntax * if &filetype !=# 'gitcommit' && &filetype !=# 'gitrebase' | set lines=52 columns=300 | endif
autocmd Syntax * if &filetype ==# 'gitcommit' || &filetype ==# 'gitrebase' | set lines=52 columns=120 | endif

" NOTE: Using the 'Syntax' keyword here, because processing of the commands
"       above is much faster then using typical 'BufEnter' or 'VimEnter'.
"  See: https://vi.stackexchange.com/questions/4493/what-is-the-order-of-winenter-bufenter-bufread-syntax-filetype-events

" Set wider sub-window sizes for NERDTree & Tagbar:
let g:NERDTreeWinSize = 80                " Sets the width of NERDTree column.
let g:tagbar_width = 45                   " Sets the width of Tagbar column.

" =============================================================================
" Neovide configuration:
" =============================================================================
if has('nvim')
  " Lower value set to increase battery life - increase if desired:
  let g:neovide_refresh_rate=60

  " Restore window size when opening:
  let g:neovide_remember_window_size = v:true

  " Shortened intervals to speed up the annoyingly slow animations:
  let g:neovide_cursor_animation_length=0.02
  let g:neovide_cursor_trail_length=0.02

  let g:neovide_cursor_antialiasing=v:true
endif
