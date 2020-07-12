" =============================================================================
" Plugins Management:
" =============================================================================
set nocompatible                          " Required by Vundle.
filetype off                              " Required by Vundle.

" This is required by Vundle to initialize:
set rtp+=~/.vim/bundle/Vundle.vim

" START Vundle loading:
call vundle#begin()

" -------------------
" Plugins enablement:
" -------------------
" NOTE: By default Vundle looks up the plugins @ Github by username/repository.

Plugin 'VundleVim/Vundle.vim'             " Let Vundle manage itself [required].

" Utilities:
Plugin 'scrooloose/nerdtree'              " NERDTree file browser
Plugin 'majutsushi/tagbar'                " Tagbar tags browser
Plugin 'ctrlpvim/ctrlp.vim'               " Full path fuzzy file/buffer/mru/tag/... finder
Plugin 'tpope/vim-sensible'               " Universal set of default configurations
Plugin 'ervandew/supertab'                " Insert completion via TAB
Plugin 'wesq3/vim-windowswap'             " Allows swaping windows without ruining layout
Plugin 'sirver/ultisnips'                 " Allows using snippets in VIM
Plugin 'godlygeek/tabular'                " Allows rapid line-up of the text
Plugin 'gilsondev/searchtasks.vim'        " Search tool for TODO, FIXME & XXX
Plugin 'shougo/deoplete.nvim'             " Asynchronous completion framework

"Plugin 'junegunn/fzf'                     " A command-line fuzzy finder
"Plugin 'junegunn/fzf.vim'                 " A set of basic VIM commands for FZF
"Plugin 'tpope/vim-dispatch'               " Start asynchronous tasks from VIM
"Plugin 'vim-scripts/bufonly.vim'          " Allow buffer deletion except current one / specified

" Git Support:
Plugin 'xuyuanp/nerdtree-git-plugin'      " Extension for NERDTree file browser
Plugin 'tpope/vim-fugitive'               " Git wrapper for VIM
Plugin 'gregsexton/gitv'                  " Repository viewer built upon 'vim-fugitive'
"Plugin 'jaxbot/github-issues.vim'         " Automatically populates omni-complete with Github issues

" Generic Programming Support:
Plugin 'vim-syntastic/syntastic'          " Plugin for external syntax checkers.
Plugin 'honza/vim-snippets'               " Snippets for UltiSnips
Plugin 'tobys/vmustache'                  " Allows usage of mustache templates in VIM
Plugin 'neomake/neomake'                  " Asynchronous linting and make framework
Plugin 'vim-scripts/doxygentoolkit.vim'   " Simplifies generating of Doxygen documentation

"Plugin 'townk/vim-autoclose'              " Automatically closes brackets and more
"Plugin 'ycm-core/youcompleteme'           " Alternative to deoplete auto-completion plugin above
"Plugin 'janko-m/vim-test'                 " Wrapper for running tests on different granulaties
"Plugin 'jakedouglas/exuberant-ctags'      " We are using Universal Ctags instead (installed system-wide)

" Syntax Higlighting:
Plugin 'sheerun/vim-polyglot'             " Bundle of enhanced syntax highlighting for most used languages

" Markdown / Writting:
Plugin 'reedes/vim-pencil'                " Soft & Hard wrapping for text & markdown files.
Plugin 'junegunn/goyo.vim'                " Adds mode for distraction-free writing
"Plugin 'dpelle/vim-LanguageTool'          " Grammar checker that uses natural language - requires Java 8+
"Plugin 'tpope/vim-markdown'               " Should be already included in recent versions of VIM

" Interface:
Plugin 'junegunn/limelight.vim'           " Enables darkening of text in other areas
Plugin 'vim-scripts/ansiesc.vim'          " Conceals ASCII escape sequences (transforming them into colors, etc.)
Plugin 'vim-airline/vim-airline'          " Status/tab line at the bottom of VIM
Plugin 'vim-airline/vim-airline-themes'   " Themes for vim-airline

" Dependencies:
Plugin 'roxma/vim-hug-neovim-rpc'         " Deoplete dependency
Plugin 'roxma/nvim-yarp'                  " Deoplete dependency

" Themes:
Plugin 'lokaltog/vim-distinguished'       " Dark theme for 256-color terminals
Plugin 'chriskempson/base16-vim'          " Base16 themes
Plugin 'w0ng/vim-hybrid'                  " Hybrid theme
Plugin 'alessandroyorba/sierra'           " Sierra theme
Plugin 'cormacrelf/vim-colors-github'     " Github theme
Plugin 'sjl/badwolf'                      " Badwolf theme
Plugin 'tomasr/molokai'                   " Molokai theme
Plugin 'morhetz/gruvbox'                  " Gruvbox theme
Plugin 'atelierbram/base2tone-vim'        " Base2Tone theme

"Plugin 'rainglow/vim'                     " 320+ syntax & UI themes

Plugin 'ryanoasis/vim-devicons'           " Enable icons for NERDTree [XXX: this must be the last!]

" STOP Vundle loading:
call vundle#end()                         " Required by Vundle.
filetype plugin indent on                 " Required by Vundle.


" =============================================================================
" Plugins customization:
" =============================================================================

" ----------------
" NERDTree config:
" ----------------
let NERDTreeShowBookmarks = 1             " Displays bookmarks by default.
let NERDTreeChDirMode = 2                 " Always change CWD of VIM whenever the node is changed.
let NERDTreeShowHidden = 1                " Show hidden files on filesystem.
let NERDTreeNaturalSort = 1               " Use natural sorting for files/folder containing numbers.
let NERDTreeRespectWildIgnore = 1         " Forces NERDTree to take 'wildignore' into account when ignoring files.
let NERDTreeCaseSensitiveSort = 1         " Sort first the files/folders starting with capital letter.
let NERDTreeWinSize = 40                  " Sets the width of NERDTree column.
let NERDTreeMinimalMenu = 0               " Change to '1' when you are familiar with the menu for nodes.
let NERDTreeAutoDeleteBuffer = 0          " Change to '1' if you no longer want to confirm prompt when deleting old buffer.

" Allow custom sorting of files, based on the list of regular expressions:
" 1. Folders | 2. Header files | 3. C/C++ files | 4. Sorting by other extensions | 5. Other files
let NERDTreeSortOrder = ['\/$', '\.h$', '\.hh$', '\.hpp$', '\.c$', '\.cc$', '\.cpp$', '[[extension]]', '*']

" Starts the NERDTree automatically - when no file(s)/folder was specified:
" NOTE: This might VIM opening times significantly if used in folder with lots
"       of files, e.g. accidentally opening VIM in /usr/bin folder...
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 | NERDTree | wincmd p | endif
"autocmd VimEnter * if argc() != 0 && !isdirectory(argv()[0]) | NERDTree | wincmd p | endif
"autocmd VimEnter * if argc() == 1 &&  isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Toggle displaying of NERDTree by pressing Ctrl+N:
map <silent> <C-N> :NERDTreeToggle<CR><A-Right>

" Function for specific filetype highlighting in NERDTree:
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" Setting of highlighting colors for function above:
" FIXME: Sync the colors with my colorscheme:
"call NERDTreeHighlightFile('ini',    'yellow',   'none',   'yellow',   '#151515')
"call NERDTreeHighlightFile('md',     'blue',     'none',   '#3366FF',  '#151515')
"call NERDTreeHighlightFile('yml',    'yellow',   'none',   'yellow',   '#151515')
"call NERDTreeHighlightFile('config', 'yellow',   'none',   'yellow',   '#151515')
"call NERDTreeHighlightFile('conf',   'yellow',   'none',   'yellow',   '#151515')
"call NERDTreeHighlightFile('json',   'yellow',   'none',   'yellow',   '#151515')

"let NERDTreeIgnore=['\~$']               " List of regular expressions of files to be ignored by NERDTree.

"let loaded_nerd_tree=1                   " Uncomment this to turn off the NERDTree.
                                          " Run ':help NERDTree.txt' for more information how to configure NERDTree.

" --------------------
" VIM-devicons config:
" --------------------
set encoding=UTF-8
set guifont=Hack\ Nerd\ Font\ 11
let g:airline_powerline_fonts = 1         " Allows using 'vim-devicons' alongside with 'vim-airline'.

" Previously used font:
"set guifont=DejaVuSansMono\ Nerd\ Font\ 11

" --------------
" Tagbar config:
" --------------
let g:tagbar_width = 40                   " Sets the width of Tagbar column.
let g:tagbar_zoomwidth = 0                " Tagbar expanding will use maximum size of currently lognest visible tag.
let g:tagbar_sort = 0                     " Sort the tags according to their position in the file.
let g:tagbar_case_insensitive = 1         " Ignore capital letters when sorting the tags.
let g:tagbar_compact = 0                  " Change this to '1' if you wish to remove the short help at top of Tagbar.
let g:tagbar_indent = 2                   " Set the width of indentation in Tagbar.
let g:tagbar_show_linenumbers = 1         " Show absolute line numbers for the tags in Tagbar.
let g:tagbar_autoshowtag=1                " Automatically open VIM folds (completely) when jumping to a tag from Tagbar.

" Toggle displaying of Tagbar by pressing Ctrl+M:
map <silent> <C-M> :TagbarToggle<CR><A-Left>

" NOTE: Tagbar highlighting colors can be changed. See :help tagbar.txt - section HIGHLIGHT COLOURS.

" ---------------
" Airline config:
" ---------------
"let g:airline_powerline_fonts = 1         " Already enabled above.

" ----------------
" Deoplete config:
" ---------------
let g:deoplete#enable_at_startup = 1      " Enables Deoplete automatically

" Disable automatic completion (manual only), etc.
try
  call deoplete#custom#option({'auto_complete': v:false, 'camel_case': v:true, 'smart_case': v:true })
catch
  :
endtry

" ----------------
" SuperTab config:
" ----------------
let g:SuperTabMappingForward = '<C-CR>'
let g:SuperTabMappingBackward = '<C-S-CR>'

" -----------------
" Syntastic config:
" -----------------
let g:syntastic_c_checkers = ['clang-check']
let g:syntastic_cpp_checkers = ['clang-check']
let g:syntastic_python_checkers = ['pylint']

let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'

" Settings recommended for newbies to Syntastic:
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Set filetypes for which Syntastic should check syntax:
"   active - check syntax after file is save
"   passive - check syntax only after calling :SyntasticCheck
let g:syntastic_mode_map = {
    \ "mode": 'active',
    \ "active_filetypes": ['c', 'cpp', 'python', 'php', 'sh'],
    \ "passive_filetypes": ['perl'] }

" Make the Syntastic window smaller if few than 5 errors are found:
function! SyntasticCheckHook(errors)
    if !empty(a:errors)
        let g:syntastic_loc_list_height = min([len(a:errors), 5])
    endif
endfunction

" -----------------
" Autoclose config:
" -----------------
let g:AutoClosePreserveDotReg = 0         " Fix for autoclose inserting "pumvisible()" everywhere:

" -----------------
" UltiSnips config:
" -----------------
let g:UltiSnipsExpandTrigger='<C-Insert>'
let g:UltiSnipsJumpForwardTrigger='<C-F>'
let g:UltiSnipsJumpBackwardTrigger='<C-B>'
let g:UltiSnipsEditSplit='vertical'       " If you want :UltiSnipsEdit to split your window.

" -----------------
" ctrlp.vim config:
" -----------------
let g:ctrlp_map = '<F2>'                  " Default mapping to invoke CtrlP.

" Ignore files specified in .gitignore file:
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" --------------
" Pencil config:
" --------------
let g:pencil#wrapModeDefault = 'soft'     " Use 'soft' line breaks as default.


" =============================================================================
" General VIM config:
" =============================================================================
set nocompatible                          " NOTE: Make sure this is enabled.
set title                                 " Display window title.

" Spelling settings:
set spelllang=en                          " Spellchecking for these languages.
set nospell                               " Disable spelling by default [enable it per file by :set spell].

" Default file encoding & fallback file encodings:
set fileencoding=UTF-8
set fileencodings='UTF-8,ISO-8859-2,CP1250'

" Autosave & backups:
set backup                                " Enable backups.
set directory=~/.vim/swap//,.//,~//       " Swap files directories (separated by comma).
set backupdir=~/.vim/backups//,.//,~//    " Backup files (ending with ~) directories.
"set autowrite                             " Automatically save before commands like :next or :make.

" Directory navigation:
set autochdir                             " Automatically changes directory to the file's location.
set tags=.ctags;                          " Look for .tags file in current directory, then parent directory, and so on...

" Commands / lines history:
set history=128                           " Number of commands to remember.
set viminfo=%,<1024,'10,/50,:100,h,f0,n~/.vim/cache/.viminfo
"           | |     |   |   |    | |  > viminfo file path
"           | |     |   |   |    | > file marks 0-9,A-Z 0=NOT stored
"           | |     |   |   |    > disable 'hlsearch' when loading viminfo
"           | |     |   |   > command-line history saved
"           | |     |   > search history saved
"           | |     > files marks saved
"           | > lines saved each register (old name for <, vi6.2)
"           > save/restore buffer list

" Mouse settings:
set mouse=a                               " Enable mouse for all VIM modes.
set mousemodel=popup                      " Popup a menu when doing right-click.

" Search settings:
set hlsearch                              " Highlight matches in search.
set incsearch                             " Use incremental search (find as you type).
set ignorecase                            " Ignore case in search.
set smartcase                             " Only ignore case when all letters are lowercase.
set wrapscan                              " Continue searching when end/beginning of file is reached.
set magic                                 " Default setting - to avoid portability problems.

" Show current line & line numbers:
set cursorline                            " Displays cursor line.
set number                                " Displays line number.
set ruler                                 " Overriden by Airline plugin.

" Set TABs properly:
set backspace=indent,eol,start            " Makes Backspace work as expected.
set smarttab                              " Respect Space/TAB settings.
set expandtab                             " Always expand TABs.
set tabstop=2                             " Sets the default TAB width.
set shiftwidth=2                          " Sets the default indent width.
set softtabstop=2                         " Sets the number of columns per TAB.

" Indentation settings:
set nosmartindent                         " Making sure the deprecated indenting is not being used.
set autoindent                            " Copy indent from current line for a new line.
set cindent                               " C-style indentation [required by Doxygen Toolkit plugin].
set shiftround                            " Round indents to multiple of 'shiftwidth' settings.
set nojoinspaces                          " Do not insert additional spaces after joining (formatting) the text.

" Buffer settings:
set clipboard=unnamed                     " Yank & paste the selection between windows without prepending the '*'.
set hidden                                " Hides the buffer instead of unloading when it is abandoned.

" Status line settings:
set laststatus=2                          " Always display status line.
set showmode                              " Put a message on the last line in INSERT/REPLACE/VISUAL.
set showcmd                               " Show (partial) command in status line.
set report=3                              " Make a report for more 3+ lines changed.

" Long lines wrapping
set showbreak=↳\                          " String to be shown when wrapping the lines.
set linebreak                             " Break lines at whitespace instead of last characters.
set nowrap                                " Do not wrap (break) lines by default.

" Cursor navigation:
set scrolloff=8                           " Minimum number of lines to show above/below cursor.
set sidescroll=0                          " Minimum number of columns to scroll horizontally [for :set wrap].
set sidescrolloff=4                       " Minimum number of columns to scroll horizontally [for :set nowrap].

" Code folding settings:
set foldmethod=indent                     " Folding based on file indentation.
set foldlevelstart=0                      " Do not fold the first level of folding.
set foldnestmax=1                         " Do not fold more than 1 level (i.e. functions folding only).

" VIM window settings:
set showtabline=2                         " Always show tab pages.
set guioptions+=rR                        " Enable always-on scrollbar the right side
set guioptions+=lL                        " Enable always-on scrollbar the left side instead

" DIFF settings:
set diffopt+=internal                     " Make sure to use internal libxdiff library (same as GIT).
set diffopt+=vertical                     " Show vertical split for diffs by default.
set diffopt+=filler                       " Show filler lines where needed.
set diffopt+=context:10                   " Show 10 lines context.
set diffopt+=iwhite                       " Ignore changes in whitespaces. (Does not ignore leading whitespace changes.)
set diffopt+=iwhiteeol                    " Ignore changes in whitespaces at the end of line, e.g. CRLF endings.
set diffopt+=algorithm:patience           " Use same diff algorithm as in GIT [currently Patience for me].
set diffopt+=indent-heuristic             " Use heuristic to make nicer diffs.

" ------------------
" Disabled settings:
" ------------------
" Brackets highlighting:
"set showmatch                             " Show (jump) matching brackets.
"set matchtime=2                           " The time before jumping back after matching the brackets.
"set matchpairt+=<:>

" FIXME:
":au FileType c,cpp,java set mps+==:;      " Jumping between '=' and ';' in C/C++ and Java programs.

" Wildmenu settings:
"set wildmenu                              " Enables wildmenu.
"set wildchar=<Tab>                        " Key to trigger wildmenu.
"set wildmode=longest:full,list            " Complete longest string, then list alternatives.

" ----------------------
" Theme / look settings:
" ----------------------
if exists('+termguicolors')               " Fix for old versions of VIM not supporting full colors.
  set termguicolors                       " Use 24-bit colors (highlight-guifg & highlight-guibg).
endif

" Automatically highlight TABs, trailing and non-breakable
" whitespaces. Also sets wrapping characters...
set list listchars=tab:»\ ,trail:·,nbsp:␣,precedes:<,extends:>

" Use custom colorscheme:
try
  colorscheme github
catch
  " Fallback mechanism for inital bootstrapping:
  if &background ==# 'dark'
    colorscheme ron
  else
    colorscheme peachpuff
  endif
endtry

" =============================================================================
" Additional tweaks & fixes:
" =============================================================================
autocmd VimEnter * let @/ = ""            " Disabling the last highlight after new startup.
" --------------------------

" Jump to a last position in a file after opening it (uses .viminfo file).
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$")
  \     | exe "normal! g'\""
  \ | endif

" --------------------------

" Set block-shape cursor for VIM only (workaround for VIM in old terminals):
if !has("gui_running")
  autocmd VimEnter * silent !echo -ne "\e[2 q"
  autocmd VimLeave * silent !echo -ne "\e[0 q"

  let &t_SI = "\e[2 q"
  let &t_EI = "\e[2 q"
endif

" --------------------------

" Automatically closes the 'No Name' buffer when starting VIM with --remote-silent option (e.g. from Terminator).
" > https://stackoverflow.com/questions/12328277/vim-remote-silent-always-opens-no-name-buffer-for-first-file <
"if bufname('%') == ''
"  set bufhidden=wipe
"endif

" Show all VIM tabs after VIM starts:
"autocmd BufRead,BufNewFile * tab ball

" --------------------------

let g:load_doxygen_syntax=1               " Enables Doxygen syntax highligting.

" Force using Doxygen highlighting for other filetypes as well (e.g. C, C++, C#, Python, ...)
autocmd syntax c,cpp,cs,python
  \ if (exists('b:load_doxygen_syntax') && b:load_doxygen_syntax)
  \   || (exists('g:load_doxygen_syntax') && g:load_doxygen_syntax)
  \     | runtime! syntax/doxygen.vim
  \ | endif

" --------------------------

" Highlight columns #81, #121 and #161 (visual text-width borders):
highlight ColorColumn ctermbg=50 guibg=#E4E4E4
let &colorcolumn="81,121,161"

" --------------------------

" Shows current syntax group of the word under the cursor by pressing Ctrl+Home.
" Useful for editing of colorscheme.
map <C-Home> :echo 'hi<' . synIDattr(synID(line('.'), col('.'), 1), 'name') . '> trans<'
  \ . synIDattr(synID(line('.'),col('.'),0), 'name') . '> lo<'
  \ . synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name') . '>'<CR>

" --------------------------

" Allows toggling off the background color for cursorline with Ctrl+End.
" NOTE: The colors needs to be set to be in sync with your current colorscheme.
" FIXME: Simplify the usage of this feature.
" FIXME: Refactor this feature - use function instead?
let ncl=0
noremap <silent> <C-End> :let ncl=!ncl<Bar>:if ncl<Bar>:hi CursorLine cterm=NONE ctermbg=253 guibg=#D8D8DD<Bar>:else<Bar>:hi CursorLine cterm=NONE ctermbg=NONE guibg=#f7f7f7<Bar>:endif<CR>
inoremap <silent> <C-End> :let ncl=!ncl<Bar>:if ncl<Bar>:hi CursorLine cterm=NONE ctermbg=253 guibg=#D8D8DD<Bar>:else<Bar>:hi CursorLine cterm=NONE ctermbg=NONE guibg=#f7f7f7<Bar>:endif<CR>

" --------------------------

" Fix for highlighting in DIFF mode:
" FIXME: Move this into separate colorscheme file.
highlight DiffAdd cterm=none ctermfg=black ctermbg=Green gui=none guifg=black guibg=green
highlight DiffDelete cterm=none ctermfg=black ctermbg=Red gui=none guifg=black guibg=red
highlight DiffChange cterm=none ctermfg=black ctermbg=Yellow gui=none guifg=black guibg=yellow
highlight DiffText cterm=none ctermfg=black ctermbg=Magenta gui=none guifg=black guibg=magenta

" --------------------------

" Fix for VIM inserting '<S-Del>' in Insert mode when accidentally presed:
inoremap <S-Del>        <Del>

" --------------------------

" Do not use shift (indent) '#'-style comments:
" > https://vim.fandom.com/wiki/Restoring_indent_after_typing_hash
set cinkeys-=0#
set indentkeys-=0#

" --------------------------

autocmd! VimEnter COMMIT_EDITMSG exec 'norm gg' | startinsert!

" --------------------------

" Automatic removal of trailing whitespaces:
"autocmd BufWritePre * :%s/\s\+$//e


" =============================================================================
" Custom (re)mappings:
" =============================================================================

" Accept (map) regularly written typos as valid commands:
cabbrev W     w
cabbrev W!    w!
cabbrev Q     q
cabbrev Q!    q!
cabbrev Qa    qa
cabbrev Wq    wq
cabbrev Wqa   wqa

cabbrev mkae  make
cabbrev maek  make

" --------------------------

" Canceling search highlight by pressing ESC 2-times:
noremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR>

" Inserts the actual TAB character with Shift+Tab:
inoremap <S-Tab> <C-V><Tab>

" Ctrl+Backspace works as Delete:
noremap  <silent> <C-Backspace> <Del>
inoremap <silent> <C-Backspace> <Del>

" Ctrl+Shift+Backspace - hungry delete of all whitespaces until the previous word:
noremap  <silent> <C-S-Backspace> v^<Right>d
inoremap <silent> <C-S-Backspace> <Esc>v^<Right>c

" Manual removal of trailing whitespaces by pressing Ctrl+Delete:
noremap  <silent> <C-Del> <Esc>:%s/\s\+$//e<CR>
inoremap <silent> <C-Del> <Esc>:%s/\s\+$//e<CR>a

" This tweak will force VIM to display all window tabs when opening file
" under the cursor (opening is no longer 'silent' in another tab):
nnoremap gf <C-W>gf

" Moving page up/down (by using Shift + Up/Down) without changing cursorline position:
noremap  <S-Up> <C-u>
inoremap <S-Up> <Esc><C-u>a

noremap  <S-Down> <C-d>
inoremap <S-Down> <Esc><C-d>a

" --------------------------

" Display contents of VIM registers by pressing F3:
noremap  <silent> <F3> <Esc>:registers<CR>
inoremap <silent> <F3> <Esc>:registers<CR>

" --------------------------

" Allows changing the width of inserted hard-TABs, as well as displayed width
" of actual TABs on the fly, by pressing:
"   > Shift + F1 -- 2-characters width of TAB
"   > Shift + F2 -- 4-characters width of TAB
"   > Shift + F3 -- 8-characters width of TAB (useful for legacy code)
noremap  <silent> <S-F1> <Esc>:set tabstop=2 softtabstop=2 shiftwidth=2<CR>
inoremap <silent> <S-F1> <Esc>:set tabstop=2 softtabstop=2 shiftwidth=2<CR>a

noremap  <silent> <S-F2> <Esc>:set tabstop=4 softtabstop=4 shiftwidth=4<CR>
inoremap <silent> <S-F2> <Esc>:set tabstop=4 softtabstop=4 shiftwidth=4<CR>a

noremap  <silent> <S-F3> <Esc>:set tabstop=8 softtabstop=8 shiftwidth=8<CR>
inoremap <silent> <S-F3> <Esc>:set tabstop=8 softtabstop=8 shiftwidth=8<CR>a

" --------------------------

" Window splitting inspired by Terminator, which allows independent browsing:
"   > Alt + Shift + I     -- split window vertically
"   > Alt + Shift + O     -- split window horizontally
"   > Alt + Cursor Keys   -- navigation between windows
"   > Ctrl + (Shift) + W  -- close current window - same as :q command
noremap <A-S-I> <C-W>v
noremap <A-S-O> <C-W>s

noremap  <C-S-W> <C-W>c
inoremap <C-S-W> <C-W>c

noremap  <silent> <A-Left> <Esc>:wincmd<Space>h<CR>
inoremap <silent> <A-Left> <Esc>:wincmd<Space>h<CR>

noremap  <silent> <A-Right> <Esc>:wincmd<Space>l<CR>
inoremap <silent> <A-Right> <Esc>:wincmd<Space>l<CR>

noremap  <silent> <A-Up> <Esc>:wincmd<Space>k<CR>
inoremap <silent> <A-Up> <Esc>:wincmd<Space>k<CR>

noremap  <silent> <A-Down> <Esc>:wincmd<Space>j<CR>
inoremap <silent> <A-Down> <Esc>:wincmd<Space>j<CR>

" --------------------------

" Manual opening / closing of tab pages:
"   >        F4 -- will open a new file tab of given path
"   > Ctrl + F4 -- will close the current tab page
noremap  <F4> <Esc>:tab drop<Space>
inoremap <F4> <Esc>:tab drop<Space>

noremap  <silent> <C-F4> <Esc>:tabc<CR>
inoremap <silent> <C-F4> <Esc>:tabc<CR>

" Navigation between currently opened tab pages:
"   > Ctrl + Shift + Left  -- Move 1 tab to the left
"   > Ctrl + Shift + Right -- Move 1 tab to the right
"   > Ctrl + Shift + Up    -- Move to the leftmost tab
"   > Ctrl + Shift + Down  -- Move to the rightmost tab
noremap  <silent> <C-S-Left> <Esc>:tabprevious<CR>
inoremap <silent> <C-S-Left> <Esc>:tabprevious<CR>

noremap  <silent> <C-S-Right> <Esc>:tabnext<CR>
inoremap <silent> <C-S-Right> <Esc>:tabnext<CR>

noremap  <silent> <C-S-Up> <Esc>:tabfirst<CR>
inoremap <silent> <C-S-Up> <Esc>:tabfirst<CR>

noremap  <silent> <C-S-Down> <Esc>:tablast<CR>
inoremap <silent> <C-S-Down> <Esc>:tablast<CR>

" Moves the current tab to the left/right by one position:
" Rearranging tab pages position:
"   > F10 -- move tab to the left
"   > F11 -- move tab to the right
noremap <silent> <F10> :execute 'silent! tabmove ' . (tabpagenr() - 2)<CR>
inoremap <silent> <F10> <Esc>:execute 'silent! tabmove ' . (tabpagenr() - 2)<CR>

noremap <silent> <F11> :execute 'silent! tabmove ' . (tabpagenr() + 1)<CR>
inoremap <silent> <F11> <Esc>:execute 'silent! tabmove ' . (tabpagenr() + 1)<CR>

" Quick shortcut for starting Tabular:
"   > Pressing <AltGr>Q followed by <Tab>, you can quickly write a character
"     to be used for automatic text aligning, and pressing <Enter> to apply it.
"   > If you follow thea alignment character with: \zs
"     Then the alignment will be done based on the character that follows the
"     one you have specified. This can be useful e.g. for YAML files, etc.
noremap   <Leader><Tab>   :Tab /
vnoremap  <Leader><Tab>   :Tab /

" =============================================================================
" Custom automatic appending of closing characters:
" =============================================================================

" FIXME: Find a way to make this work more consistently.
" Quick jump with cursor behind the brackets with Ctrl+Space:
noremap  <silent> <C-Space>   <Esc><Right>%%a
inoremap <silent> <C-Space>   <Esc><Right>%%a

inoremap '<C-Space>           ''<Left>
inoremap ''                   ''<Left>
inoremap ''<Esc>              ''
inoremap ''<C-Space>          ''
inoremap '''                  '''
inoremap '''<CR>              '''<CR>'''<Esc>O

inoremap "<C-Space>           ""<Left>
inoremap ""                   ""<Left>
inoremap ""<Esc>              ""
inoremap ""<C-Space>          ""
inoremap """                  """
inoremap """<CR>              """<CR>"""<Esc>O

inoremap (<CR>                (<CR>)<Esc>O<Tab>
inoremap (<Esc>               (
inoremap (<C-Space>           ()<Left>

inoremap ((                   ()<Left>
inoremap ((<CR>               (<CR>)<Esc>O<Tab>
inoremap ((<Esc>              ((
inoremap ((<Right>            ((
inoremap ((<C-Space>          ()<Left>
inoremap (((                  (((

inoremap {<CR>                {<CR>}<Esc>O
inoremap {<Esc>               {
inoremap {<C-Space>           {}<Left>

inoremap {{                   {}<Left>
inoremap {{<CR>               {<CR>}<Esc>O
inoremap {{<Esc>              {{
inoremap {{<Right>            {{
inoremap {{<C-Space>          {}<Left>
inoremap {{{                  {{{

inoremap [<CR>                [<CR>]<Esc>O<Tab>
inoremap [<Esc>               [
inoremap [<C-Space>           []<Left>

inoremap [[                   []<Left>
inoremap [[<CR>               [<CR>]<Esc>O<Tab>
inoremap [[<Esc>              [[
inoremap [[<Right>            [[
inoremap [[<C-Space>          []<Left>
inoremap [[[                  [[[

inoremap <<CR>                <<CR>><Esc>O<Tab>
inoremap <<Esc>               <
inoremap <<Space>             <<Space>
inoremap <<C-Space>           <><Left>

inoremap <<                   <><Left>
inoremap <<<CR>               <<CR>><Esc>O<Tab>
inoremap <<<Esc>              <<
inoremap <<<Right>            <<
inoremap <<<Space>            <<<Space>
inoremap <<<C-Space>          <><Left>
inoremap <<<                  <<<


" =============================================================================
" Custom mapping for comments autocompletion:
" =============================================================================

inoremap //                   //<Space>


" =============================================================================
" Specific configuration per file-type:
" =============================================================================
" FIXME: Refactoring of this section needed!

" Automatically enables Pencil for text files:
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

" NOTE: The 'nested :TagbarOpen' automatically opens Tagbar for the specified
"       file types, and must be called before any other setlocal commands...
autocmd FileType,BufRead  make                      setlocal nospell                noexpandtab

autocmd FileType,BufRead  *.c                       setlocal   spell textwidth=80
autocmd FileType,BufRead  *.h                       setlocal   spell textwidth=80

autocmd FileType,BufRead *.cc                       setlocal   spell textwidth=120
autocmd FileType,BufRead *.cpp                      setlocal   spell textwidth=120
autocmd FileType,BufRead *.CPP                      setlocal   spell textwidth=120
autocmd FileType,BufRead *.cxx                      setlocal   spell textwidth=120
autocmd FileType,BufRead *.c++                      setlocal   spell textwidth=120
autocmd FileType,BufRead *.cp                       setlocal   spell textwidth=120
autocmd FileType,BufRead *.C                        setlocal   spell textwidth=120

autocmd FileType,BufRead *.hh                       setlocal   spell textwidth=120
autocmd FileType,BufRead *.hpp                      setlocal   spell textwidth=120
autocmd FileType,BufRead *.HPP                      setlocal   spell textwidth=120
autocmd FileType,BufRead *.hxx                      setlocal   spell textwidth=120
autocmd FileType,BufRead *.h++                      setlocal   spell textwidth=120
autocmd FileType,BufRead *.hp                       setlocal   spell textwidth=120
autocmd FileType,BufRead *.H                        setlocal   spell textwidth=120

autocmd FileType,BufRead *.sh                       setlocal   spell textwidth=120
autocmd FileType,BufRead *.py                       setlocal   spell textwidth=79  | let &colorcolumn="73,80"
autocmd FileType,BufRead *.php                      setlocal   spell textwidth=120
autocmd FileType,BufRead *.tex                      setlocal   spell textwidth=120

autocmd FileType,BufRead *.spec                     setlocal nospell textwidth=120

"let &colorcolumn="81,121,161"

" Mavenir specific:
autocmd FileType,BufRead *.msg  setlocal filetype=yaml


" =============================================================================
" Tips & tricks (a.k.a. stuff I tend to forget):
" =============================================================================
" 1. When you have issues pasting a text into VIM, use this command before pasting:
"      :set paste
"    Then reset your VIM behaviour with:
"      :set nopaste
"
" 2. Shortcuts for folding in VIM:
"   > zi - open all
"   > zm - close all
"   > zo - open current
"   > zc - close current
"
" 3. Shifting indentation in Insert Mode:
"   > Ctrl+T - indent 1 tab-width to the right
"   > Ctrl+D - indent 1 tab-width to the left
"
" 4. All plugins ared loaded AFTER the .vimrc has been read!

" =============================================================================
" TODO notes:
" =============================================================================
" 1) Add script/function to automatically generate .ctags if they are missing.
"   ->> Use keyboard button for it?
