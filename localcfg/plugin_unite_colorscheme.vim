if exists("g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute("let g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

nnoremap <silent> [unite]s :<C-u>Unite -winheight=10 -auto-preview
    \ -buffer-name=colorschemes colorscheme<CR>
