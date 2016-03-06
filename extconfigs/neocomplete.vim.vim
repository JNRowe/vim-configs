if !has('lua')
    finish
endif

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_close_preview = 1
let g:neocomplete#data_directory = g:vim_cache_dir . '/neocomplete'
let g:neocomplete#disable_auto_complete = 1
