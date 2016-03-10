if exists("g:loaded_extconfigs_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute("let g:loaded_extconfigs_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

nnoremap <LocalLeader># :GundoToggle<CR>

let g:gundo_help = 0
let g:gundo_preview_bottom = 1
