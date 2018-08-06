scriptencoding utf-8

" Requires Font Awesome in places
" Note: I have FA resolve locally as webfonts are disabled in my browsers,
" if you don't have a similar setup then the following won't work.
call denite#custom#option('_', {
    \   'direction': 'dynamictop',
    \   'empty': v:true,
    \   'immediately_1': v:true,
    \   'prompt': ' ',
    \   'statusline': v:false,
    \   'vertical_preview': v:true
    \ }
\ )

call denite#custom#var('buffer', 'date_format', '%FT%T')

if executable('ag')
    call denite#custom#var('file/rec', 'command',
        \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
    call denite#custom#var('grep', 'command', ['ag'])
    call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', [])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])
endif

nnoremap [denite] <Nop>
nmap <Leader>u [denite]

function! s:denite_key(key)
    let s:first = a:key[0]
    if type(a:key) == v:t_list
        let s:source = a:key[1]
        let s:buffer_name = len(a:key) == 3 ? a:key[2] : split(s:source, ':')[0]
    else
        let s:source = a:key
        let s:buffer_name = a:key
    endif

    execute 'nnoremap <silent> [denite]' . s:first .
        \ ' :<C-u>Denite -buffer-name=' . s:buffer_name . ' ' .
        \ s:source . '<CR>'
endfunction

for s:k in [
    \   ['p',       'buffer'],
    \   'change',
    \   ['s',       'colorscheme'],
    \   ['x',       'command'],
    \   ['h',       'command_history'],
    \   'file',
    \   ['o',       'file/old'],
    \   ['R',       'file/rec'],
    \   ['C',       'filetype'],
    \   ['/',       'grep'],
    \   ['t',       'grep:::\(TODO\\|FIXME\)', 'task'],
    \   ['H',       'help'],
    \   ['l',       'line:buffers'],
    \   ['o',       'outline'],
    \   [':',       'output'],
    \   'register',
    \   ['T',       'tag'],
    \ ]
    call s:denite_key(s:k)
    unlet s:k
endfor

if executable('git')
    call denite#custom#alias('source', 'file/rec/git', 'file/rec')
    call denite#custom#var('file/rec/git', 'command',
        \ ['git', 'ls-files', '-co', '--exclude-standard'])
    call s:denite_key(['g', 'file/rec/git'])
endif
