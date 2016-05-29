if SLoaded(expand('<sfile>'))
    finish
endif

let g:neosnippet#data_directory = g:vim_cache_dir . '/neosnippet'

function! Neosnippet_Map()
    imap <C-k> <Plug>(neosnippet_expand_or_jump)
    smap <C-k> <Plug>(neosnippet_expand_or_jump)
    xmap <C-k> <Plug>(neosnippet_expand_target)
endfunction
