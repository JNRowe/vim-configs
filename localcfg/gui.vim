if exists("g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
     execute("let g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

set mousemodel=popup_setpos

" Always display line number in the GUI
set number
set relativenumber

" Shift insert works the same as in a terminal
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

if has('gui_macvim')
    set guifont=Menlo:h13
else
    set guifont=Consolas\ 13
endif
colorscheme jnrowe

if has('title')
    set titlestring+=%{v:servername!='GVIM'?'\ ['.v:servername.']':''}
endif

" Omnicompletion rocks, but <C-x><C-o> doesn't.
inoremap <C-Space> <C-x><C-o>
