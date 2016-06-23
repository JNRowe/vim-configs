" Set up the menus so emenu works properly
runtime! ALL menu.vim

set nottybuiltin
set term=$TERM  " Annoying, but necessary, to refresh termcap
if has('termguicolors') && &t_Co > 256
    set termguicolors
endif

if $TERM ==# 'linux' || $TERM =~# '^xterm' || $TERM ==# 'st' ||
    \ $TERM =~# '^st-' || split($COLORFGBG . ';padding', ';')[0] == 15
    set background=dark
else
    set background=light
endif
if !exists('g:colors_name')  " Don't reload on write
    if &t_Co >= 88
        colorscheme native
    else
        colorscheme elflord
    endif
endif

" Change the cursor colour for insert mode {{{
if &term =~? '^rxvt' && exists('&t_SI')
    let &t_SI = "\<Esc>]12;purple\x7"
    let &t_EI = "\<Esc>]12;green\x7"
endif
" }}}

" Omnicompletion rocks, but <C-x><C-o> doesn't.
inoremap <Nul> <C-x><C-o>
