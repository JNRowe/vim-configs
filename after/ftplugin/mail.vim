" Make these scrub the old entry if they exists

nnoremap <buffer> [advice] <Nop>
nmap <buffer> <Leader>a [advice]

for s:prio in ['perhaps', 'should', 'must']
    for s:due in ['now', 'soon', 'whenever']
        execute "nnoremap <buffer> <silent> [advice]" . s:prio[0] . s:due[0] .
            \ " mxgg/^$/<CR>iX-advice: " . s:prio . " read " . s:due .
            \ "<CR><Esc>`x"
    endfor
endfor

" So called smart quotes. ‘, ’, “, ” respectively
imap <buffer> <LocalLeader>_` <C-v>u2018
imap <buffer> <LocalLeader>_' <C-v>u2019
imap <buffer> <LocalLeader>`` <C-v>u201c
imap <buffer> <LocalLeader>'' <C-v>u201d

setlocal tw=72
setlocal formatoptions+=2
