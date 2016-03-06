if has('lua')
    finish
endif

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_auto_close_preview = 1
let g:neocomplcache_enable_auto_delimiter = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_temporary_dir = g:vim_cache_dir . '/neocomplcache'
