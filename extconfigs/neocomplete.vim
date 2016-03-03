if has('lua')
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#data_directory = g:xdg_cache_dir . '/tmp/neocomplete'
    let g:neocomplete#disable_auto_complete = 1
endif
