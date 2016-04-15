if exists("g:loaded_ftd_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute "let g:loaded_ftd_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1"
endif

autocmd BufRead,BufNewFile *.do set filetype=sh
autocmd BufRead,BufNewFile *.do let g:is_posix=1
