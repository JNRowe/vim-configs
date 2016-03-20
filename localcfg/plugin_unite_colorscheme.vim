if exists("g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute("let g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

call unite#custom#profile('colourscheme', 'context', {
    \   'auto_preview': 1,
    \   'buffer_name': 'colourscheme',
    \   'direction': 'dynamicbottom',
    \   'prompt': '',
    \   'resume': 1,
    \   'start_insert': 0,
    \   'vertical': 1,
    \   'winwidth': 15,
    \ }
\ )

nnoremap <silent> [unite]s :<C-u>Unite -profile-name=colourscheme
    \ colorscheme<CR>
