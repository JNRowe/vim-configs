if exists("g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute("let g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

let g:dwm_map_keys = 0

nnoremap [dwm] <Nop>
nmap <Leader>d [dwm]

for [s:key, s:cmd] in [
    \   ['n',       'New'],
    \   ['c',       ':exe DWM_Close'],
    \   ['f',       'Focus'],
    \   ['<left>',  'Rotate(0)'],
    \   ['<right>', 'Rotate(1)'],
    \ ]
    if stridx(s:cmd, '(') == -1
        let s:cmd .= '()'
    endif
    if s:cmd[0] != ':'
        let s:cmd = 'call DWM_' . s:cmd
    else
        let s:cmd = s:cmd[1:]
    endif

    execute("nnoremap <silent> [dwm]" . s:key .
        \ " :<C-u>" . s:cmd . "<CR>")
endfor
