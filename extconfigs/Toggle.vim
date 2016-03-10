if exists("g:loaded_extconfigs_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute("let g:loaded_extconfigs_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

imap <C-M-T> <C-O>:call Toggle()<CR>
nmap <C-M-T> :call Toggle()<CR>
vmap <C-M-T> <ESC>:call Toggle()<CR>
