if exists("g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
     execute("let g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

set guiheadroom=0

set guioptions+=chR
set guioptions-=L
set guioptions-=R
set guioptions-=T
set guioptions-=m
set guioptions-=r

set mousemodel=popup_setpos

" Always display line number in the GUI
set number
set relativenumber

" Shift insert works the same as in a terminal
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

set guifont=Consolas\ 13
colorscheme jnrowe

if has('title')  && has('clientserver')
    set titlestring+=%{v:servername!='GVIM'?'\ ['.v:servername.']':''}
endif

" Omnicompletion rocks, but <C-x><C-o> doesn't.
inoremap <C-Space> <C-x><C-o>

if has('menu')
    nmap <silent> <S-F4> :call ToggleFlag("guioptions","m")<CR>
endif
if has('toolbar')
    nmap <silent> <C-F4> :call ToggleFlag("guioptions","T")<CR>
endif
