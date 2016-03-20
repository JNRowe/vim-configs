if exists("g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute("let g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

let g:Gitv_CommitStep = 500
let g:Gitv_OpenHorizontal = "auto"
let g:Gitv_WipeAllOnClose = 1