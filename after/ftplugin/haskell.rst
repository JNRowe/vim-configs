``after/ftplugin/haskell.vim``
==============================

.. code-block:: vim

    call MnemonicMap('Haskell', {
        \ 'buffer': v:true,
        \ 'local': v:true,
        \ 'mode': 'v'
    \ })

    vnoremap <buffer> [Haskell]= :Tabularize /=<CR>
    vnoremap <buffer> [Haskell]: :Tabularize /::<CR>
    vnoremap <buffer> [Haskell]- :Tabularize /-><CR>
