if exists("g:loaded_ftd_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute("let g:loaded_ftd_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

autocmd BufRead,BufNewFile .editorconfig set filetype=dosini
