" Some terminal fonts don't support the necessary characters, and I'd rather it
" work 100% of the time than occasionally annoy me when I get a replacement box
if has("gui_running")
    let g:airline_left_sep = '⮀'
    let g:airline_right_sep = '⮂'
    let g:airline_branch_prefix = '⭠'
    let g:airline_readonly_symbol = '⭤'
    let g:airline_linecolumn_prefix = '⭡'
endif

let g:airline_theme='jellybeans'

" vim-bad-whitespace handles this well for me
let g:airline_detect_whitespace=0

let g:airline_powerline_fonts=1

let g:airline_enable_hunks=1
