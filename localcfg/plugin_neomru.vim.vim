if SLoaded(expand("<sfile>"))
    finish
endif

let g:neomru#directory_mru_path = g:vim_cache_dir . '/neomru/directory'
let g:neomru#file_mru_path = g:vim_cache_dir . '/neomru/file'
let g:neomru#follow_links = 1
let g:neomru#time_format = "%FT%T: "
