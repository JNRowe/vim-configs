``localcfg/plugin_vim_bufmru.vim``
==================================

.. code-block:: vim

    call MnemonicMap('bufmru')

    nnoremap <silent> [bufmru]l  :BufMRU<CR>
    nnoremap <silent> [bufmru]B  :BufMRUPrev<CR>
    nnoremap <silent> [bufmru]b  :BufMRUNext<CR>
