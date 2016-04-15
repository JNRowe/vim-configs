if SLoaded(expand("<sfile>"))
    finish
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
if !exists('g:colors_name')  " Don't reload on write
    colorscheme jnrowe
endif

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
