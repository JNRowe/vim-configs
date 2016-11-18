call unite#custom#profile('colourscheme', 'context', {
    \   'auto_preview': v:true,
    \   'buffer_name': 'colourscheme',
    \   'direction': 'dynamicbottom',
    \   'prompt': '',
    \   'resume': v:true,
    \   'start_insert': v:false,
    \   'vertical': v:true,
    \   'winwidth': 15,
    \ }
\ )

nnoremap <silent> [unite]s :<C-u>Unite -profile-name=colourscheme
    \ colorscheme<CR>
