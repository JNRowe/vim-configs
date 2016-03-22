if exists("g:loaded_ftd_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute("let g:loaded_ftd_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

autocmd BufNewFile,BufRead ~/.pypirc set filetype=dosini
