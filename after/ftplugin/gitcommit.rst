``after/ftplugin/gitcommit.vim``
================================

.. code-block:: vim

    nnoremap <buffer> [trailer] <Nop>
    nmap <buffer> <LocalLeader>t [trailer]

    for s:type in ['Acked', 'Reviewed', 'Signed-off', 'Tested']
        execute 'nnoremap <buffer> <silent> [trailer]' . tolower(s:type[0]) .
            \ ' :%!git interpret-trailers --trailer ' . shellescape(s:type . '-by') .
            \ '=' . shellescape(g:user_email) . '<CR>'
    endfor
