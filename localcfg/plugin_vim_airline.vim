scriptencoding utf-8

let g:airline_theme = 'powerlineish'
let g:airline_skip_empty_sections = 1

if has('gui_running')
    let g:airline_left_sep = '╗'
    let g:airline_right_sep = '╔'

    " Requires Font Awesome in places
    " Note: I have FA resolve locally as webfonts are disabled in my browsers,
    " if you don't have a similar setup then the following won't work.
    let g:airline_symbols = {
        \ 'branch': '',
        \ 'crypt': '',
        \ 'linenr': '⏎',
        \ 'maxlinenr': '☰',
        \ 'modified': '➕',
        \ 'notexists': '∉',
        \ 'paste': ' ',
        \ 'readonly': '',
        \ 'space': ' ',
        \ 'spell': '',
        \ 'whitespace': '·',
    \ }
else
    let g:airline_symbols_ascii = 1
endif

let g:airline#extensions#disable_rtp_load = v:true
let g:airline_extensions = [
    \ 'csv',
    \ 'denite',
    \ 'po',
    \ 'whitespace',
    \ 'wordcount',
\ ]

if v:version >= 800 && has('signs')
    let g:airline_extensions += ['ale']
endif
if has('quickfix')
    let g:airline_extensions += ['quickfix']
endif
if executable('git')
    let g:airline_extensions += ['branch', 'hunks']
    let g:airline#extensions#branch#format = 2
    if has('gui_running')
        let g:airline#extensions#hunks#hunk_symbols = ['➕ ', '≔ ', '➖ ']
    endif
    let g:airline#extensions#hunks#non_zero_only = v:true
endif

let g:airline#extensions#csv#column_display = 'Name'
let g:airline#extensions#whitespace#mixed_indent_algo = 2
