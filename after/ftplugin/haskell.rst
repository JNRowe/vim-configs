``after/ftplugin/haskell.vim``
==============================

Use ``:Tabularize`` to do simple lazy code formatting, as this is far quicker
than doing a complete pretty print

::

    call MnemonicMap('Haskell', {
        \ 'buffer': v:true,
        \ 'local': v:true,
        \ 'mode': 'v'
    \ })

    vnoremap <buffer> [Haskell]= :Tabularize /=<CR>
    vnoremap <buffer> [Haskell]: :Tabularize /::<CR>
    vnoremap <buffer> [Haskell]- :Tabularize /-><CR>
