if exists("g:loaded_xcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute("let g:loaded_xcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

nmap ga <Plug>(UnicodeGA)