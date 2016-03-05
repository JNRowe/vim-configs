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
let g:unite_force_overwrite_statusline = 0

nnoremap [unite] <Nop>
nmap <Leader>u [unite]

nnoremap <silent> [unite]a :<C-u>Unite buffer:"-" bookmark neomru/file<CR>
nnoremap <silent> [unite]! :<C-u>Unite output/shellcmd<CR>
nnoremap <silent> [unite]/ :<C-u>Unite grep:.<CR>
nnoremap <silent> [unite]: :<C-u>Unite output<CR>
nnoremap <silent> [unite]? :<C-u>Unite source<CR>
nnoremap <silent> [unite]b :<C-u>Unite bookmark<CR>
nnoremap <silent> [unite]c :<C-u>Unite change<CR>
nnoremap <silent> [unite]f :<C-u>Unite file/async<CR>
nnoremap <silent> [unite]g :<C-u>Unite file_rec/git<CR>
nnoremap <silent> [unite]R :<C-u>Unite file_rec/async<CR>
nnoremap <silent> [unite]h :<C-u>Unite history<CR>
nnoremap <silent> [unite]m :<C-u>Unite mapping<CR>
nnoremap <silent> [unite]p :<C-u>Unite buffer:"-"<CR>
nnoremap <silent> [unite]r :<C-u>Unite register<CR>
nnoremap <silent> [unite]u :<C-u>Unite neomru/file<CR>
nnoremap <silent> [unite]w :<C-u>Unite window<CR>
