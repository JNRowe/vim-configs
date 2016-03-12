if exists("g:loaded_xcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute("let g:loaded_xcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_shell = '/bin/sh'

" Define fallback symbols for when fancy signs don't work
" Requires Font Awesome in places
" Note: I have FA resolve locally as webfonts are disabled in my browsers,
" if you don't have a similar setup then the following won't work.
if (&termencoding ==# "utf-8") || has("gui_running")
    let g:syntastic_error_symbol = ''
    let g:syntastic_style_error_symbol = ''
    let g:syntastic_warning_symbol = ''
    let g:syntastic_style_warning_symbol = ''
endif

let g:syntastic_c_checkers = ["gcc", "splint"]
let g:syntastic_c_compiler_options =
    \ '-std=gnu11 Wall -Wextra -Werror -pedantic'
let g:syntastic_rst_checkers = ["rst2pseudoxml", "restyle"]
let g:syntastic_sh_checkers = ["checkbashisms", "sh"]
