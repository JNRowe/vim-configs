``after/ftplugin/gitrebase.vim``
================================

Use my custom maps::

    call MnemonicMap('rebase', {'buffer': v:true, 'local': v:true})

    for s:verb in ['Cycle', 'Edit', 'Fixup', 'Pick', 'Reword', 'Squash']
        execute 'nnoremap <buffer> <silent> [rebase]' . tolower(s:verb[0]) .
            \ ' :' . s:verb .'<CR>'
    endfor

.. note::

    Only those :command:`git rebase` options which are used regularly are
    enabled, others can rely on ``:Cycle``.
