if exists("g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute("let g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

let g:rooter_change_directory_for_non_project_files = 1
let g:rooter_patterns = ['.git/', '.hg/', '.meta/']
let g:rooter_silent_chdir = 1
let g:rooter_use_lcd = 1
