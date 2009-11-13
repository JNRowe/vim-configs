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

syntax on
filetype plugin indent on

" Fancy fancy % matching
runtime! macros/matchit.vim

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

