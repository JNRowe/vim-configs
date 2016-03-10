if exists("g:loaded_extconfigs_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute("let g:loaded_extconfigs_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

if !has('lua')
    finish
endif

let g:neocomplete#data_directory = g:vim_cache_dir . '/neocomplete'
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_close_preview = 1
let g:neocomplete#enable_auto_delimiter = 1
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#enable_smart_case = 1
