scriptencoding utf-8

if SLoaded(expand('<sfile>'))
    finish
endif

nnoremap [quickfix] <Nop>
nmap <Leader>f [quickfix]

function! s:qf_key(key, cmd)
    " Commands ending with backslash don't have <CR> appended
    if a:cmd[len(a:cmd)-1] == '\'
        let l:cmd = a:cmd[:len(a:cmd)-2]
    else
        let l:cmd = a:cmd . '<CR>'
    endif
    execute 'nnoremap <silent> [quickfix]' . a:key . ' :' . l:cmd
endfunction


" Display occurrences of current word in quickfix window
call s:qf_key('sw', 'execute "vimgrep " . expand("<cword>") . " %"<CR>:copen')
" … and last search
call s:qf_key('ss', "execute \"vimgrep /\".@/.\"/g %\"<CR>:copen")

for [s:key, s:cmd] in [
    \   ['wc', 'cclose'],
    \   ['wo', 'copen 7<CR><C-w>p\'],
    \   ['n', 'cnext'],
    \   ['p', 'cprevious'],
    \   ['r', 'crewind'],
    \   ['l', 'clast'],
    \ ]
    call s:qf_key(s:key, s:cmd)
endfor

nmap <M-Down> :cnext<CR>
nmap <M-Up> :cprevious<CR>
