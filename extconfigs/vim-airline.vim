" Some terminal fonts don't support the necessary characters, and I'd rather it
" work 100% of the time than occasionally annoy me when I get a replacement box
if has("gui_running")
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
endif

let g:airline_theme='jellybeans'

" vim-bad-whitespace handles this well for me
let g:airline#extensions#whitespace#enabled=0

let g:airline_powerline_fonts=1

let g:airline#extensions#nrrwrgn#enabled=1
