``after/ftplugin/gitcommit.vim``
================================

.. code-block:: vim

    call MnemonicMap('Trailer', {'buffer': v:true, 'local': v:true})

    for s:type in ['Acked', 'Reviewed', 'Signed-off', 'Tested']
        execute 'nnoremap <buffer> <silent> [Trailer]' . tolower(s:type[0]) .
            \ ' :%!git interpret-trailers --trailer ' . shellescape(s:type . '-by') .
            \ '=' . shellescape(g:user_email) . '<CR>'
    endfor
