if SLoaded(expand('<sfile>'))
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

let s:font_family='Consolas'
let &guifont=s:font_family . ' 13'
if !exists('g:colors_name')  " Don't reload on write
    colorscheme jnrowe
endif

if has('title')  && has('clientserver')
    set titlestring+=%{v:servername!='GVIM'?'\ ['.v:servername.']':''}
endif

" Omnicompletion rocks, but <C-x><C-o> doesn't.
inoremap <C-Space> <C-x><C-o>

if has('menu')
    nmap <silent> <S-F4> :call ToggleFlag('guioptions', 'm')<CR>
endif
if has('toolbar')
    nmap <silent> <C-F4> :call ToggleFlag('guioptions', 'T')<CR>
endif

function! s:font_complete(arglead, cmdline, cursorpos)
    " Yeah, some of these are *huuuuuge* but I often pop up a snippet in
    " a meeting and this helps.
    return [s:font_family . '\ 13', ]
        \ + map(range(8), "s:font_family . '\\ ' . (v:val * 8 + 16)")
endfunction
command! -nargs=1 -complete=customlist,s:font_complete Fontsel set guifont=<args>
