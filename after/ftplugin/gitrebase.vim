nnoremap <buffer> [rebase] <Nop>
nmap <buffer> <LocalLeader>r [rebase]

" Not all methods available in ftplugin
for s:verb in ['Cycle', 'Edit', 'Fixup', 'Pick', 'Reword', 'Squash']
    execute 'nnoremap <buffer> <silent> ' . tolower(s:verb[0]) .
        \ ' :' . s:verb .'<CR>'
endfor
