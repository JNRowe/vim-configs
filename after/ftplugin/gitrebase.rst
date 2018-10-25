``after/ftplugin/gitrebase.vim``
================================

.. code-block:: vim

    nnoremap <buffer> [rebase] <Nop>
    nmap <buffer> <LocalLeader>r [rebase]

Not all methods available in ftplugin

.. code-block:: vim

    for s:verb in ['Cycle', 'Edit', 'Fixup', 'Pick', 'Reword', 'Squash']
        execute 'nnoremap <buffer> <silent> ' . tolower(s:verb[0]) .
            \ ' :' . s:verb .'<CR>'
    endfor
