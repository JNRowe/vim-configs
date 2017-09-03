let g:ledger_align_at = 44
let g:ledger_date_format = '%F'

nnoremap [ledger] <Nop>
nmap <Leader>l [ledger]

for [s:key, s:cmd] in [
    \   ['a',       ':LedgerAlign'],
    \   ['d',       'align_amount_at_cursor()'],
    \   ['n',       'entry()'],
    \   ['s',       'transaction_state_toggle(line("."), " *?!")'],
    \   ['t',       'transaction_date_set(".", "auxiliary")'],
    \ ]
    if s:cmd[0] !=# ':'
        let s:cmd = 'call ledger#' . s:cmd
    else
        let s:cmd = s:cmd[1:]
    endif

    execute 'autocmd Filetype ledger nnoremap <silent> [ledger]' .
        \ s:key . ' :' . s:cmd . '<CR>'
endfor

augroup jnrowe_vim_ledger
    autocmd FileType ledger inoremap <silent> <Tab>
        \ <C-r>=ledger#autocomplete_and_align()<CR>
augroup END
