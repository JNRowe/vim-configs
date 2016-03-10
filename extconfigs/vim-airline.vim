if exists("g:loaded_xcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute("let g:loaded_xcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

let g:airline_theme = 'powerlineish'

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

let g:airline#extensions#disable_rtp_load = 1
let g:airline_extensions = [
    \ 'csv',
    \ 'nrrwrgn',
    \ 'whitespace',
    \ 'wordcount',
\ ]

if has('quickfix')
    let g:airline_extensions += ['quickfix', 'syntastic']
end
if executable('git')
    let g:airline_extensions += ['branch', 'hunks']
    let g:airline#extensions#branch#format = 2
    let g:airline#extensions#hunks#hunk_symbols = ['➕ ', '≔ ', '➖ ']
    let g:airline#extensions#hunks#non_zero_only = 1
endif

let g:airline#extensions#csv#column_display = 'Name'
let g:airline#extensions#whitespace#mixed_indent_algo = 2
