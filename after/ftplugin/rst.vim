nnoremap <buffer> [heading] <Nop>
nmap <buffer> <Leader>h [heading]

" This creates reST headings using *my* favourite definitions of =, - and '
for [s:key, s:sym] in [['U', '='], ['u', '-'], ['_', "'"]]
    execute "nnoremap <buffer> <silent> [heading]" . s:key .
        \ " yyp<C-v>$r" . s:sym . "i<Esc>"
endfor
