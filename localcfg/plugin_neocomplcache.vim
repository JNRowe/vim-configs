if exists("g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute("let g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

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

if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.python = '[^. \t]\.\w*'
