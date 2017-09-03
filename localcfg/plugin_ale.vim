scriptencoding utf-8

let g:ale_completion_max_suggestions = 20
let g:ale_open_list = 1

if (&termencoding ==# 'utf-8') || has('gui_running')
    let g:ale_sign_error = ''
    let g:ale_sign_warning = ''
    let g:ale_sign_info = ''  " ''
    let g:ale_sign_style_error = ''
    let g:ale_sign_style_warning = ''
endif
