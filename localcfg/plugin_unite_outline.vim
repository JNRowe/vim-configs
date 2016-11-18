call unite#custom#profile('outline', 'context', {
    \   'buffer_name': 'outline',
    \   'direction': 'dynamicbottom',
    \   'immediately': v:false,
    \   'prompt': '',
    \   'quit': v:false,
    \   'resume': v:true,
    \   'start_insert': v:false,
    \   'vertical': v:true,
    \   'winwidth': 30,
    \ }
\ )

nnoremap <silent> [unite]o :<C-u>Unite -profile-name=outline outline<CR>
if has('folding')
    nnoremap <silent> [unite]F :<C-u>Unite -profile-name=outline
        \ outline:folding<CR>
endif
