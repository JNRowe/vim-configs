scriptencoding utf-8

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

function! s:unite_key(key)
    let s:first = a:key[0]
    if type(a:key) == type([])
        let s:source = a:key[1]
        let s:buffer_name = len(a:key) == 3 ? a:key[2] : split(s:source, ':')[0]
    else
        let s:source = a:key
        let s:buffer_name = a:key
    endif

    execute 'nnoremap <silent> [unite]' . s:first .
        \ ' :<C-u>Unite -buffer-name=' . s:buffer_name . ' ' .
        \ s:source . '<CR>'
endfunction

for s:k in [
    \   ['a',       'buffer:"-" bookmark neomru/file', 'all'],
    \   ['!',       'output/shellcmd',                 'shell'],
    \   ['/',       'grep:.'],
    \   [':',       'output'],
    \   ['?',       'source'],
    \   'bookmark',
    \   'change',
    \   'dein',
    \   ['f',       'file/async',                      'file'],
    \   ['j',       'junkfile'],
    \   ['R',       'file_rec/async',                  'file/rec'],
    \   'history',
    \   'mapping',
    \   ['p',       'buffer:"-"'],
    \   'register',
    \   ['t',       'grep:%::\(TODO\\|FIXME\)',        'task'],
    \   ['u',       'neomru/file'],
    \   'window',
    \ ]
    call s:unite_key(s:k)
    unlet s:k
endfor

if exists('$DISPLAY') && executable('wmctrl')
    call s:unite_key(['x', 'window/gui'])
endif

if executable('git')
    call s:unite_key(['g', 'file_rec/git'])
endif

" This replaces my previous use of vim-startify
nnoremap <S-F1> :<C-u>Unite -buffer-name=start neomru/file bookmark
    \ file_rec/async<CR>

if has('autocmd')
    augroup jnrowe_unite
        if argc() == 0 |
            autocmd VimEnter * Unite -buffer-name=start -no-start-insert
                \ neomru/file bookmark file_rec/async
        endif
        autocmd FileType unite nmap <buffer> ? <Plug>(unite_toggle_auto_preview) |
            \ HideBadWhitespace
    augroup END
endif
