if exists("g:loaded_extconfigs_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute("let g:loaded_extconfigs_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

let g:neomru#directory_mru_path = g:vim_cache_dir . '/neomru/directory'
let g:neomru#file_mru_path = g:vim_cache_dir . '/neomru/file'
let g:neomru#time_format = "%FT%T: "
