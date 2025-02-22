" =============================================================================
" General GUI configuration:
" =============================================================================
" Font used for GUI only (Vim/nVim inherits font settings from the terminal):

" REGULAR VARIANTS - bigger, but trimmed devicons / better look:
" --------------------------------------------------------------
"set guifont=MesloLGS\ Nerd\ Font\ 12
"set guifont=Hack\ Nerd\ Font\ 12
"set guifont=DejaVuSansM\ Nerd\ Font\ 12

" MONO VARIANTS - working smaller devicons / worse look:
" ------------------------------------------------------
set guifont=MesloLGS\ Nerd\ Font\ Mono\ 12
"set guifont=Hack\ Nerd\ Font\ Mono\ 12
"set guifont=DejaVuSansM\ Nerd\ Font\ Mono\ 12

" Maximimize the gVim window for 1920x1080 / 24" monitor:
autocmd Syntax * if &filetype !=# 'gitcommit' && &filetype !=# 'gitrebase' | set lines=44 columns=188 | endif
autocmd Syntax * if &filetype ==# 'gitcommit' || &filetype ==# 'gitrebase' | set lines=44 columns=100 | endif

" NOTE: Using the 'Syntax' keyword here, because processing of the commands
"       above is much faster then using typical 'BufEnter' or 'VimEnter'.
"  See: https://vi.stackexchange.com/questions/4493/what-is-the-order-of-winenter-bufenter-bufread-syntax-filetype-events

" Set wider sub-window sizes for NERDTree & Tagbar:
let g:NERDTreeWinSize = 40                " Sets the width of NERDTree column.
let g:tagbar_width = 40                   " Sets the width of Tagbar column.

noremap  <silent> <S-F9> :execute 'silent !~/.vim/.togglelayout'<CR> :source ~/.gvimrc<CR>
inoremap <silent> <S-F9> <Esc>:execute 'silent !~/.vim/.togglelayout'<CR> :source ~/.gvimrc<CR>

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
