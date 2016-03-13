if exists("g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
     execute("let g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

" Set up the menus so emenu works properly
source $VIMRUNTIME/menu.vim

if $TERM ==# "linux" || $TERM =~ "^xterm" || $TERM == "st" ||
    \ $TERM =~ "^st-" || split($COLORFGBG . ";padding", ";")[0] == 15
    set background=dark
else
    set background=light
endif
if &t_Co >= 88
    colorscheme native
else
    colorscheme elflord
endif

" Change the cursor colour for insert mode {{{
if &term =~? '^rxvt' && exists('&t_SI')
    let &t_SI = "\<Esc>]12;purple\x7"
    let &t_EI = "\<Esc>]12;green\x7"
endif
" }}}

" Omnicompletion rocks, but <C-x><C-o> doesn't.
inoremap <Nul> <C-x><C-o>
