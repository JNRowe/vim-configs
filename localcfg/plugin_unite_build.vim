if SLoaded(expand('<sfile>'))
    finish
endif

nnoremap <silent> [unite]x :<C-U>Unite -buffer-name=build/main build<CR>
