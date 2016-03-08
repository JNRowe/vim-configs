let g:airline_theme='powerlineish'

" Requires powerline-symbols
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Requires Font Awesome in places
" Note: I have FA resolve locally as webfonts are disabled in my browsers,
" if you don't have a similar setup then the following won't work.
let g:airline_symbols = {
    \ 'branch': '',
    \ 'crypt': '',
    \ 'linenr': '⏎',
    \ 'modified': '➕',
    \ 'paste': ' ',
    \ 'readonly': '',
    \ 'space': ' ',
    \ 'whitespace': '·',
\ }


let g:airline#extensions#disable_rtp_load=1
if has('signs') && executable('git')
    let g:airline#extensions#hunks#enabled=1
    let g:airline#extensions#branch#format = 2
endif
let g:airline#extensions#nrrwrgn#enabled=1
let g:airline#extensions#wordcount#enabled=1
