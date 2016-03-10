if exists("g:loaded_extconfigs_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute("let g:loaded_extconfigs_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

call unite#custom#profile('outline', 'context', {
    \   'buffer_name': 'outline',
    \   'direction': 'dynamicbottom',
    \   'immediately': 0,
    \   'prompt': '',
    \   'quit': 0,
    \   'resume': 1,
    \   'start_insert': 0,
    \   'vertical': 1,
    \   'winwidth': 30,
    \ }
\ )

nnoremap <silent> [unite]o :<C-u>Unite -profile-name=outline outline<CR>
