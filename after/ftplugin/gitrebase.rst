``after/ftplugin/gitrebase.vim``
================================

.. code-block:: vim

    call MnemonicMap('rebase', {'buffer': v:true, 'local': v:true})

Not all methods available in ftplugin

.. code-block:: vim

    for s:verb in ['Cycle', 'Edit', 'Fixup', 'Pick', 'Reword', 'Squash']
        execute 'nnoremap <buffer> <silent> [rebase]' . tolower(s:verb[0]) .
            \ ' :' . s:verb .'<CR>'
    endfor
