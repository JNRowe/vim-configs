scriptencoding utf-8

nnoremap [quickfix] <Nop>
nmap <LocalLeader>f [quickfix]
nnoremap [location] <Nop>
nmap <LocalLeader>l [location]

function! s:qf_key(type, key, cmd)
    let l:group = a:type == 'l' ? 'location' : 'quickfix'
    " Commands ending with backslash don't have <CR> appended
    if a:cmd[len(a:cmd)-1] == '\'
        let l:cmd = a:cmd[:len(a:cmd)-2]
    else
        let l:cmd = a:cmd . '<CR>'
    endif
    execute 'nnoremap <silent> [' . l:group . ']' . a:key . ' :' . a:type . l:cmd
endfunction

" Display occurrences of current word in quickfix window
nnoremap <silent> [quickfix]sw :execute "vimgrep " . expand("<cword>") . " %"<CR>
" … and last search
nnoremap <silent> [quickfix]ss :execute "vimgrep /" . getreg("/") . "/g %"<CR>

for s:t in ['l', 'c']
    for [s:key, s:cmd] in [
        \   ['wc', 'close'],
        \   ['wo', 'open 7<CR><C-w>p\'],
        \   ['b', 'bottom'],
        \   ['n', 'next'],
        \   ['p', 'previous'],
        \   ['r', 'rewind'],
        \   ['l', 'last'],
        \ ]
        call s:qf_key(s:t, s:key, s:cmd)
    endfor
endfor

nmap <M-Down> :cnext<CR>
nmap <M-Up> :cprevious<CR>
