if exists("g:loaded_extconfigs_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute("let g:loaded_extconfigs_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

nnoremap [sideways] <Nop>
nmap <Leader>s [sideways]

for s:key in ['Left', 'Right']
    execute("nnoremap <silent> [sideways]<" . s:key . ">" .
        \ " :<C-u>Sideways" . s:key . "<CR>")
    execute("nnoremap <silent> [sideways]<S-" . s:key . ">" .
        \ " :<C-u>SidewaysJump" . s:key . "<CR>")
endfor

for s:key in ['A', 'I']
    execute("onoremap <silent> a" . tolower(s:key) .
        \ " <Plug>SidewaysArgumentTextobj" . s:key)
    execute("xnoremap <silent> a" . tolower(s:key) .
        \ " <Plug>SidewaysArgumentTextobj" . s:key)
endfor
