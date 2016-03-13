if exists("g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute("let g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

let g:neosnippet#data_directory = g:vim_cache_dir . "/neosnippet"

imap <C-k> <Plug>(neosnippet_expand_or_jump)
vmap <C-k> <Plug>(neosnippet_expand_or_jump)
