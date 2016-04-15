if SLoaded(expand("<sfile>"))
    finish
endif

nnoremap <silent> [unite]y :<C-U>Unite -buffer-name=history/yank
    \ history/yank <CR>
