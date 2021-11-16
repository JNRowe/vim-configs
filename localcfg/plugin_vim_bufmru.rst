``localcfg/plugin_vim_bufmru.vim``
==================================

.. _vim-bufmru-custom-maps:

Use my custom maps::

    call keymaps#mnemonic_map('bufmru')

    nnoremap <silent> [bufmru]l       :BufMRU<CR>
    nnoremap <silent> [bufmru]<Left>  :BufMRUPrev<CR>
    nnoremap <silent> [bufmru]<Right> :BufMRUNext<CR>

.. seealso::

    * :func:`keymaps#mnemonic_map() <mnemonic_map>`

.. tip::

    Imagine :kbd:`<Left>` and :kbd:`<Right>` are moving across a timeline of
    used buffers.
