if SLoaded(expand('<sfile>'))
    finish
endif

nnoremap <silent> [unite]W :<C-U>Unite session<CR>
