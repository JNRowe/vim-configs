" vim: sw=4 sts=4 et tw=72 fdm=marker

scriptencoding utf-8

set nocompatible

set autoindent
set autowrite
set backspace=indent,eol,start
set backupcopy=auto,breakhardlink
if has("ballooneval")
    set ballooneval
endif
set cmdheight=2
set completeopt=longest,menuone,preview
set confirm
set cursorline
set dictionary+=/usr/share/dict/words
set directory=~/.vim/tmp
set encoding=utf-8
set fileencoding=utf-8
set foldcolumn=1
set foldlevelstart=99
set foldmethod=syntax
set formatoptions+=tcrqn2l1
set formatoptions-=wvb
set grepprg=grep\ -nH\ --exclude='.*.swp'\ --exclude=tags\ $*
set hidden
set history=1000
set ignorecase
set incsearch
set infercase
set joinspaces
set lazyredraw
set matchpairs+=<:>
set nobackup
set nofsync
set nonumber
set nostartofline
set pastetoggle=<F4>
set report=0
set scrolloff=5
set shiftround
set shiftwidth=4
set showbreak="+ "
set showcmd
set showfulltag
set showmatch
set showtabline=1
set smartcase
set smarttab
set spell
set spelllang=en_gb
set suffixes+=.pyc,.pyo
set swapsync=
set tabstop=4
set tags+=$HOME/.vim/tags/python.ctags
set textwidth=72
set title
set ttyfast
set viminfo=!,'1000,<1000,h,n~/.vim/viminfo
set whichwrap=<,>,[,]
set wildignore+=*.log,*.pdf,*.swp,*.o,*.pyc,*.pyo,*~
set wildmenu
set wildmode=longest,full

" Use securemodelines.vim
set nomodeline
let g:secure_modelines_verbose = 0
let g:secure_modelines_modelines = 15

" taglist settings {{{
let Tlist_Exit_OnlyWindow = 1
let Tlist_Inc_Winwidth = 1
let Tlist_Sort_Type = "name"
let Tlist_Use_Right_Window = 1
let Tlist_Use_SingleClick = 1
nnoremap <silent> <F7> :TlistUpdate<CR>
nnoremap <silent> <F8> :Tlist<CR>
nnoremap <silent> <F9> :TlistSync<CR>
" }}}

" Syntax files settings {{{
let b:nroff_is_groff=1 " Default to groff
let g:sh_fold_enabled=1 " Fold here-doc chunks
let is_bash=1 " Default to bash for sh syntax
let python_highlight_all=1 " Highlight everything possible for python
" }}}

if has("gui_running")
    " GUI specific settings {{{
    set cmdheight=2

    set mousemodel=popup_setpos

    " Always display line number in the GUI
    set number

    " Shift insert works the same as in a terminal
    map <S-Insert> <MiddleMouse>
    map! <S-Insert> <MiddleMouse>

    set guifont=Inconsolata\ Bold\ 14
    colorscheme darklooks
    " }}}
else
    " Terminal specific settings {{{
    if &t_Co >= 88
        colorscheme inkpot
    else
        colorscheme taqua
    endif
    if $TERM == "linux" || split($COLORFGBG, ";")[0] == 15
        set background=dark
    else
        set background=light
    endif
    " }}}
endif " }}}

" Change the cursor colour for insert mode {{{
if &term =~? '^rxvt-unicode' && exists('&t_SI')
    let &t_SI="\<Esc>]12;purple\x7"
    let &t_EI="\<Esc>]12;green\x7"
endif " }}}

" Load abbreviations {{{
if filereadable(expand("~/.vim/abbr"))
    source ~/.vim/abbr
endif
if filereadable(expand("~/.vim/abbr-local"))
    source ~/.vim/abbr-local
endif
" }}}

" Autocommands {{{
if has("autocmd")
    " Scrub all autocommands
    autocmd!

    syntax on
    filetype plugin indent on

    " Fancy fancy % matching
    runtime! macros/matchit.vim

    " Reread the vimrc after writing.
    " Note: This *can* cause problems, so be careful!
    autocmd BufWritePost .vimrc source %

    " Use :make to compile C/C++, even without a Makefile
    autocmd FileType c,cpp
        \ if glob('Makefile') == ""
        \   let &makeprg = "gcc -o %< %"
        \ endif

    " Mark lines longer than 80 chars as an error, taken from the wiki
    autocmd BufWinEnter * let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
    autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

    " Make <Return> jump to tag in help files
    autocmd FileType help nmap <buffer> <Return> <C-]>

    autocmd FileType text setlocal textwidth=72

    " Jump to the last known cursor position if possible, taken from the
    " wiki
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

    autocmd BufNewFile,BufRead /tmp/*-sup.*
        \ set ft=mail |
        \ set ts=2 sw=2 et

    autocmd BufNewFile,BufRead /tmp/ditz*
        \ set ft=rest |
        \ set ts=2 sw=2 et

    autocmd FileType rst setlocal makeprg=rst2html.py\ %\ /dev/null
    " Map UU and Uu to add = and - underlining for headings
    autocmd FileType rst map UU yyp<c-v>$r=i<ESC>
    autocmd FileType rst map Uu yyp<c-v>$r-i<ESC>

    autocmd FileType html,liquid,xhtml,xml
        \ imap <Leader>& &amp; |
        \ imap <Leader>< &lt; |
        \ imap <Leader>> &gt; |
        \ imap <Leader>" &quot; |
        \ imap <Leader><Space> &nbsp;

    " Toggle tab/wrap settings when editing Makefiles
    autocmd BufEnter Makefile set wrap noexpandtab nosmarttab
    autocmd BufLeave Makefile set nowrap expandtab smarttab

    " Turn off search highlighting when entering a buffer
    autocmd VimEnter * nohls
    " Turn off search highlighting when idle
    autocmd CursorHold * nohls | redraw

    " Always do a full syntax refresh, this is still fast enough on
    " a netbook
    autocmd BufEnter * syntax sync fromstart

    " Current directory follows the file being edited for local files
    autocmd BufEnter *
        \ if bufname("") !~ '^[[:alnum:]]*://' |
        \   silent! lcd %:p:h |
        \ endif

    " Open quickfix window, if there are any entries
    autocmd QuickFixCmdPost * belowright cwindow 5

    " make timing, from http://github.com/ciaranm/dotfiles-ciaranm/ {{{
    autocmd QuickFixCmdPre make let g:make_start_time=localtime()

    autocmd QuickFixCmdPost make
        \ let g:make_total_time=localtime() - g:make_start_time |
        \ echo printf("Time taken: %dm%2.2ds", g:make_total_time / 60,
        \   g:make_total_time % 60)
    " }}}

    " Simple status for minibufexpl/quickfix windows {{{
    fun! <SID>FixBufferTitles()
        if "-MiniBufExplorer-" == bufname("%")
            setlocal statusline=\[Buffers\]
        endif
    endfun
    autocmd BufWinEnter *
        \ let oldwinnr=winnr() |
        \ windo call <SID>FixBufferTitles() |
        \ exec oldwinnr . " wincmd w"
    autocmd FileType qf setlocal statusline=\[Quickfix\ messages\]
    " }}}
endif
" }}}

" Fancy status bar {{{
set laststatus=2
set statusline=
set statusline+=%-3.3n
if winwidth(0) > 90 " Full file name in wide windows
   set statusline+=%F
else
   set statusline+=%f
endif
set statusline+=%h%m%r%w " Flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}, " Filetype
set statusline+=%{&encoding}, " Encoding
set statusline+=%{&fileformat}] " File format
"set statusline+=\ %{VimBuddy()} " vim buddy
set statusline+=%= " Align to right
set statusline+=0x%B/%-8b\ " Current character
set statusline+=%-14.(%l,%c%V%)\ %<%P " Offset
" }}}

" Fancy window titles where possible {{{
if has('title') && (has('gui_running') || &title)
    set titlestring=
    set titlestring+=%F\ " File name
    set titlestring+=%h%m%r%w " Flags
    set titlestring+=\ -\ %{v:progname} " Program name
endif " }}}

" Gentoo bug summary browser
let g:bugsummary_browser="opera -newpage '%s'"

" Show tabs and trailing whitespace {{{
if (&termencoding == "utf-8") || has("gui_running")
    set list listchars=tab:»·,trail:·,extends:…,nbsp:‗
else
    set list listchars=tab:>-,trail:.,extends:>,nbsp:_
endif " }}}

" Map Shift-F12 to switch between light and dark
function! Switch_background()
    if &background == "light"
        set background=dark
    else
        set background=light
    endif
endfunction
map <S-F12> :call Switch_background()<CR>

" Toggle line numbering
map <C-F12> :set number!<CR>

" Quickly move between buffers {{{
map <M-Left> :bprev<CR>
map <M-Right> :bnext<CR>

map <Esc>1 :buffer 1<CR>
map <Esc>2 :buffer 2<CR>
map <Esc>3 :buffer 3<CR>
map <Esc>4 :buffer 4<CR>
map <Esc>5 :buffer 5<CR>
map <Esc>6 :buffer 6<CR>
map <Esc>7 :buffer 7<CR>
map <Esc>8 :buffer 8<CR>
map <Esc>9 :buffer 9<CR>
map <Esc>0 :buffers<CR>
" }}}

" Ctrl + up/down to skip paragraphs {{{
nnoremap  <c-up> {
nnoremap  <c-down> }
" }}}

" Remove nasty page skipping mappings {{{
inoremap <s-up> <c-o>gk
inoremap <s-down> <c-o>gj
noremap <s-up> gk
noremap <s-down> gj
" }}}

" Make c-g verbose by default
nnoremap <c-g> 2<c-g>

" Wrap current word in brackets {{{
nmap ,( mpwbi(<Esc>ea)<Esc>`pl
nmap ,[ mpwbi[<Esc>ea]<Esc>`pl
nmap ,{ mpwbi{<Esc>ea}<Esc>`pl
" }}}

" Shift + left/right to select text {{{
nnoremap <s-left> vh
nnoremap <s-right> vl
nnoremap <s-up> Vk
nnoremap <s-down> Vj
" }}}

" Custom menu items {{{
if has("menu")
    amenu L&ocations.&Awesome.rc :e ~/.xdg/config/awesome/rc.lua<CR>
    amenu L&ocations.&Awesome.theme :e ~/.xdg/config/awesome/theme.lua<CR>
    amenu L&ocations.&vimrc :e ~/.vimrc<CR>
endif " }}}

" Function keys {{{
nmap <F1> :set hlsearch!<CR>
nnoremap <F2> :set list!<CR>
nmap <F3> :set expandtab!<CR>
" F4 toggles paste
" F7-F9 are used for taglist, and are defined above
nmap <F10> :make check<CR>
nmap <S-F10> :exec "make -C " . expand("%:p:h") . " check"<CR>
nmap <F11> :make<CR>
nmap <S-F11> :exec "make -C " . expand("%:p:h")<CR>
" Delete trailing whitespace:
nmap <F12> :%s/\s\+$//<CR>
vmap <F12> :s/\s\+$//<CR>
" }}}

" Jump to buffer with single click
let g:miniBufExplUseSingleClick = 1

" Automatic session management {{{
autocmd VimEnter * call LoadSession()
autocmd VimLeave * call SaveSession()
function! SaveSession()
    if g:load_sessions == 1
        execute "mksession! ~/.vim/view/auto_session.vim"
    endif
endfunction

function! LoadSession()
    if argc() == 0
        let g:load_sessions = 1
        if filereadable(expand("~/.vim/view/auto_session.vim"))
            execute "source ~/.vim/view/auto_session.vim"
        endif
    else
        let g:load_sessions = 0
    endif
endfunction
" }}}

" Don't attempt to load csapprox if gui isn't supported
if !has("gui")
    let g:CSApprox_loaded = 1
endif


