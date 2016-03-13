if exists("g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute("let g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

" Requires Font Awesome in places
" Note: I have FA resolve locally as webfonts are disabled in my browsers,
" if you don't have a similar setup then the following won't work.
call unite#custom#profile('default', 'context', {
    \   'direction': 'dynamictop',
    \   'empty': 1,
    \   'immediately': 1,
    \   'prompt': ' ',
    \   'prompt_focus': 1,
    \   'start_insert': 1,
    \   'toggle': 1,
    \   'vertical_preview': 1
    \ }
\ )

let g:unite_data_directory = g:vim_cache_dir . '/unite'
let g:unite_force_overwrite_statusline = 0
let g:unite_source_buffer_time_format = '%FT%T'

if executable('ag')
    let g:unite_source_rec_async_command = split('ag --follow --hidden -g ""')

    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--vimgrep -S'
    let g:unite_source_grep_recursive_opt = ''
endif

nnoremap [unite] <Nop>
nmap <Leader>u [unite]

for s:k in [
    \   ['a',       'buffer:"-" bookmark neomru/file', 'all'],
    \   ['!',       'output/shellcmd',                 'shell'],
    \   ['/',       'grep:.'],
    \   [':',       'output'],
    \   ['?',       'source'],
    \   'bookmark',
    \   'change',
    \   ['f',       'file/async',                      'file'],
    \   ['j',       'junkfile'],
    \   ['R',       'file_rec/async',                  'file/rec'],
    \   'history',
    \   'mapping',
    \   'neobundle',
    \   ['p',       'buffer:"-"'],
    \   'register',
    \   ['t',       'grep:%::\(TODO\\|FIXME\)',        'task'],
    \   ['u',       'neomru/file'],
    \   'window',
    \ ]

    let s:key = s:k[0]
    if type(s:k) == 3
        let s:source = s:k[1]
        let s:buffer_name = len(s:k) == 3 ? s:k[2] : split(s:source, ':')[0]
    else
        let s:source = s:k
        let s:buffer_name = s:k
    endif

    execute("nnoremap <silent> [unite]" . s:key .
        \ " :<C-u>Unite -buffer-name=" . s:buffer_name . " " .
        \ s:source . "<CR>")
    unlet s:k
endfor

if $DISPLAY != "" && executable('wmctrl')
    nnoremap <silent> [unite]x :<C-U>Unite -buffer-name=window/gui window/gui<CR>
endif

if executable('git')
    nnoremap <silent> [unite]g :<C-U>Unite -buffer-name=file_rec/git
        \ file_rec/git<CR>
endif

" This replaces my previous use of vim-startify
nnoremap <S-F1> :<C-u>Unite -buffer-name=start neomru/file bookmark
    \ file_rec/async<CR>

if has("autocmd")
    autocmd VimEnter * if argc() == 0 |
        \   Unite -buffer-name=start -no-start-insert neomru/file bookmark
        \       file_rec/async |
        \ endif
    autocmd FileType unite nmap <buffer> ? <Plug>(unite_toggle_auto_preview) |
        \ HideBadWhitespace
endif
