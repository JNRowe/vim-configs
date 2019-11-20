``localcfg/plugin_vim_bufmru.vim``
==================================

.. _vim-bufmru-custom-maps:

Use my custom maps::

    call MnemonicMap('bufmru')

    nnoremap <silent> [bufmru]l       :BufMRU<CR>
    nnoremap <silent> [bufmru]<Left>  :BufMRUPrev<CR>
    nnoremap <silent> [bufmru]<Right> :BufMRUNext<CR>

.. tip::

    Imagine :kbd:`<Left>` and :kbd:`<Right>` are moving across a timeline of
    used buffers.
