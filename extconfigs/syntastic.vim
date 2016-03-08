let g:syntastic_auto_loc_list = 1

" Define fallback symbols for when fancy signs don't work
if (&termencoding ==# "utf-8") || has("gui_running")
    let g:syntastic_error_symbol = '✘'
    let g:syntastic_style_error_symbol = '☔'
    let g:syntastic_warning_symbol = '⚠'
    let g:syntastic_style_warning_symbol = '☂'
endif

let g:syntastic_c_checkers = ["gcc", "splint"]
let g:syntastic_c_compiler_options = '-std=gnu11 Wall -Wextra -Werror -pedantic'
