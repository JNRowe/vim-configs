if exists("g:loaded_extconfigs_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute("let g:loaded_extconfigs_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

let g:eighties_bufname_additional_patterns = [
    \ '__committia_diff__',
    \ '__committia_status__',
\ ]
" A little wiggle room for files from silly people ;)
let g:eighties_extra_width = 5
