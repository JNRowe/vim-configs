if SLoaded(expand('<sfile>'))
    finish
endif

nnoremap <silent> [unite]X :<C-U>Unite -buffer-name=build/qf quickfix<CR>
