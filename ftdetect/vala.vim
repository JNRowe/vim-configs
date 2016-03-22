if exists("g:loaded_ftd_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute("let g:loaded_ftd_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

autocmd BufRead,BufNewFile *.vala set filetype=vala
autocmd BufRead,BufNewFile *.vapi set filetype=vala
autocmd BufRead,BufNewFile *.gs set filetype=genie
