if !(has('signs') && executable('git'))
    finish
endif

let g:gitgutter_sign_added            = '▶'
let g:gitgutter_sign_modified         = '▸'
let g:gitgutter_sign_modified_removed = '◂'
let g:gitgutter_sign_removed          = '◀'

highlight GitGutterAdd          guifg=#8ae234
highlight GitGutterChange       guifg=#fce94f
highlight GitGutterDelete       guifg=#ef2929
highlight GitGutterChangeDelete guibg=#ef2929 guifg=#fce94f

let g:gitgutter_diff_args = '-w'
let g:gitgutter_eager = 0
