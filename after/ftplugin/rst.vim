nnoremap <buffer> [heading] <Nop>
nmap <buffer> <LocalLeader>h [heading]

" This creates reST headings using *my* favourite definitions of =, - and '
for [s:key, s:sym] in [['1', '='], ['2', '-'], ['3', "'"]]
    execute 'nnoremap <buffer> <silent> [heading]' . s:key .
        \ ' yyp<C-v>$r' . s:sym . 'o<Esc>.'
endfor

setlocal complete+=s

" Break undo sequence on sentence level punctuation.
"
" This kind of feels better when editing prose and taking advantage of
" undo-tree.  Not yet sure if it is too granular.
for s:key in split(',.!¿?:;', '\zs')
    execute 'inoremap <buffer> ' . s:key . ' ' . s:key . '<C-g>u'
endfor
