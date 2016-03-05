call unite#custom#profile('default', 'context', {
    \   'direction': 'dynamictop',
    \   'empty': 1,
    \   'immediately': 1,
    \   'prompt': '» ',
    \   'prompt_focus': 1,
    \   'start_insert': 1,
    \   'toggle': 1,
    \   'vertical_preview': 1
    \ }
\ )

let g:unite_data_directory = g:vim_cache_dir . '/unite'

nnoremap <C-p> :Unite buffer<CR>
