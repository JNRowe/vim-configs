if exists("g:loaded_extconfigs_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute("let g:loaded_extconfigs_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

" Disable netrw, as it clashes with plugins
let g:loaded_netrwPlugin = 1

let g:neobundle#cache_file = g:vim_cache_dir . '/neobundle.cache'
let g:neobundle#log_filename = g:vim_cache_dir . '/neobundle.log'
" Sledgehammer to fix jedi-vim's bundling
let g:neobundle#types#git#enable_submodule = 0
