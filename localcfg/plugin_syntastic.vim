if SLoaded(expand('<sfile>'))
    finish
endif

let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_debug_file = g:vim_cache_dir . '/syntastic.log'
let g:syntastic_shell = '/bin/sh'

" Define fallback symbols for when fancy signs don't work
" Requires Font Awesome in places
" Note: I have FA resolve locally as webfonts are disabled in my browsers,
" if you don't have a similar setup then the following won't work.
if (&termencoding ==# 'utf-8') || has('gui_running')
    let g:syntastic_error_symbol = ''
    let g:syntastic_style_error_symbol = ''
    let g:syntastic_warning_symbol = ''
    let g:syntastic_style_warning_symbol = ''
endif

let g:syntastic_c_checkers = ['gcc', 'splint']
let g:syntastic_c_compiler_options =
    \ '-std=gnu11 Wall -Wextra -Werror -pedantic'
let g:syntastic_rst_checkers = ['rst2pseudoxml', 'restyle']
let g:syntastic_sh_checkers = ['checkbashisms', 'sh']

" Use our pretty icons instead of the default text.
if has('signs')
    for [k, v] in items({'error': '✘', 'warning': '⚠', 'info': '☁'})
        let s:capped = toupper(k[0]) . k[1:]
        if (&termencoding ==# 'utf-8') || has('gui_running')
            execute 'sign define Syntastic' . s:capped . ' text='. v .
                \ ' texthl=' . s:capped .
                \ ' icon=' .  expand('~/.vim/icons/' . k . '.png')
        else
            execute 'sign define Syntastic' . s:capped .
                \ ' text=' . s:capped[0] . s:capped[0] . ' texthl=' . s:capped
        endif
    endfor
endif
