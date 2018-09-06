scriptencoding utf-8

if !(has('signs') && executable('git'))
    finish
endif

nnoremap [gitgutter] <Nop>
nmap <Leader>g [gitgutter]
let g:gitgutter_map_keys = v:false

for [s:key, s:cmd] in [
    \   ['Down',  'NextHunk'],
    \   ['Up',    'PrevHunk'],
    \   ['Space', 'Toggle'],
    \ ]
    execute 'nnoremap <silent> [gitgutter]<' . s:key . '> '
        \ ':GitGutter' . s:cmd . '<CR>'
endfor
nnoremap <silent> [gitgutter]p :GitGutterPreviewHunk<CR>

" If you have more than 50 edits you probably need to commit!
let g:gitgutter_max_signs = 50

let g:gitgutter_sign_added              = ''
let g:gitgutter_sign_modified           = ''
let g:gitgutter_sign_removed            = ''
let g:gitgutter_sign_removed_first_line = '˙'
let g:gitgutter_sign_modified_removed   = ''
