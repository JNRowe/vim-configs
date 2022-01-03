``after/ftplugin/haskell.vim``
==============================

.. include:: ../../.includes/scriptversion.rst

.. _haskell-custom-maps:

Use ``:Tabularize`` to do simple lazy code formatting, as this is far quicker
than doing a complete pretty print::

    call keymaps#mnemonic_map('Haskell', #{
    \   buffer: v:true,
    \   local: v:true,
    \   modes: 'v',
    \ })

    vnoremap <buffer> [Haskell]= :Tabularize /=<CR>
    vnoremap <buffer> [Haskell]: :Tabularize /::<CR>
    vnoremap <buffer> [Haskell]- :Tabularize /-><CR>

.. seealso::

    * :func:`keymaps#mnemonic_map() <mnemonic_map>`
