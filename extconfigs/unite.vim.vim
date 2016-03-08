call unite#custom#profile('default', 'context', {
    \   'direction': 'dynamictop',
    \   'empty': 1,
    \   'immediately': 1,
    \   'prompt': '» ',
    \   'prompt_focus': 1,
    \   'start_insert': 1,
    \   'toggle': 1,
    \   'vertical_preview': 1
    \ }
\ )

let g:unite_data_directory = g:vim_cache_dir . '/unite'
let g:unite_force_overwrite_statusline = 0
let g:unite_source_buffer_time_format='%FT%T'

if executable('ag')
    let g:unite_source_rec_async_command = split('ag --follow --hidden -g ""')

    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts='--vimgrep -S'
    let g:unite_source_grep_recursive_opt=''
endif

nnoremap [unite] <Nop>
nmap <Leader>u [unite]

for s:k in [
    \   ['a',       'buffer:"-" bookmark neomru/file'],
    \   ['!',       'output/shellcmd'],
    \   ['/',       'grep:.'],
    \   [':',       'output'],
    \   ['?',       'source'],
    \   'bookmark',
    \   'change',
    \   ['f',       'file/async'],
    \   ['g',       'file_rec/git'],
    \   ['j',       'junkfile'],
    \   ['R',       'file_rec/async'],
    \   'history',
    \   'mapping',
    \   ['p',       'buffer:"-"'],
    \   'register',
    \   ['t',       'grep:%::\(TODO\\|FIXME\)'],
    \   ['u',       'neomru/file'],
    \   'window',
    \ ]

    let s:key = s:k[0]
    let s:source= type(s:k) == 3 ? s:k[1] : s:k

    execute("nnoremap <silent> [unite]" . s:key . " :<C-u>Unite " . s:source . "<CR>")
    unlet s:k
endfor

" This replaces my previous use of vim-startify
nnoremap <S-F1> :<C-u>Unite neomru/file bookmark file_rec/async<CR>

if has("autocmd")
    autocmd VimEnter * if argc() == 0 |
        \   Unite -no-start-insert neomru/file bookmark file_rec/async |
        \ endif
    autocmd FileType unite nmap <buffer> ? <Plug>(unite_toggle_auto_preview) |
        \ HideBadWhitespace
endif
