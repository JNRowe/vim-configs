for [s:mode, s:cmd_prefix] in [
    \   ['i', '<C-O>'],
    \   ['n', ''],
    \   ['v', '<ESC>'],
    \ ]
    execute s:mode . 'noremap <C-M-T> ' . s:cmd_prefix .
        \ ':call Toggle()<CR>'
endfor
