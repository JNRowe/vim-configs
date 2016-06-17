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
if has('folding')
    nnoremap <silent> [unite]F :<C-u>Unite -profile-name=outline
        \ outline:folding<CR>
endif
