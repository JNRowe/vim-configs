scriptencoding utf-8

if SLoaded(expand('<sfile>'))
    finish
endif

if !(has('signs') && executable('git'))
    finish
endif

" Requires Font Awesome in places
" Note: I have FA resolve locally as webfonts are disabled in my browsers,
" if you don't have a similar setup then the following won't work.
let g:signify_sign_add               = ''
let g:signify_sign_delete            = ''
let g:signify_sign_change            = ''
let g:signify_sign_changedelete      = ''
let g:signify_skip_filetype = {'diff': 1, 'gitcommit': 1}
let g:signify_vcs_list = ['git', 'hg']

highlight SignifySignAdd                        guifg=#8ae234
highlight SignifySignChange                     guifg=#fce94f
highlight SignifySignDelete                     guifg=#ef2929
highlight SignifySignChangeDelete guibg=#ef2929 guifg=#fce94f

highlight link SignifySignDeleteFirstLine SignifySignDelete
