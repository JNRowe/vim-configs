setlocal makeprg=rst2html.py\ %\ /dev/null

" Map UU/Uu/U_ to add =/-/' underlining for headings respectively
" You may not like this as it overrides the standard U mapping, but I never
" use it.
map <buffer> UU yyp<C-v>$r=i<ESC>
map <buffer> Uu yyp<C-v>$r-i<ESC>
map <buffer> U_ yyp<C-v>$r'i<ESC>
