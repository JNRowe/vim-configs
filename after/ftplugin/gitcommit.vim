nnoremap <buffer> [trailer] <Nop>
nmap <buffer> <LocalLeader>t [trailer]

silent let s:user_info = systemlist('git config user.name')[0] .
    \ ' <' . systemlist('git config user.email')[0] . '>'
for s:type in ['Acked', 'Reviewed', 'Signed-off', 'Tested']
    execute 'nnoremap <buffer> <silent> [trailer]' . tolower(s:type[0]) .
        \ ' :%!git interpret-trailers --trailer ' . shellescape(s:type . '-by') .
        \ '=' . shellescape(s:user_info) . '<CR>'
endfor
