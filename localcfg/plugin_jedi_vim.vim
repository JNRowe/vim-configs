if SLoaded(expand("<sfile>"))
    finish
endif

let g:jedi#auto_vim_configuration = 0
" Use neocomplete
let g:jedi#completions_enabled = 0
let g:jedi#use_splits_not_buffers = "bottom"
