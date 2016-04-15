if SLoaded(expand("<sfile>"))
    finish
endif

let g:neosnippet#data_directory = g:vim_cache_dir . "/neosnippet"

imap <C-k> <Plug>(neosnippet_expand_or_jump)
vmap <C-k> <Plug>(neosnippet_expand_or_jump)
