let g:airline_theme='powerlineish'

" vim-bad-whitespace handles this well for me
let g:airline#extensions#whitespace#enabled=0

let g:airline_powerline_fonts=1

let g:airline#extensions#disable_rtp_load=1
if has('signs') && executable('git')
    let g:airline#extensions#hunks#enabled=1
end
let g:airline#extensions#nrrwrgn#enabled=1
let g:airline#extensions#wordcount#enabled=1
