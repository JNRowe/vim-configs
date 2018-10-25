``localcfg/plugin_vim_bufmru.vim``
==================================

.. code-block:: vim

    nnoremap [bufmru] <Nop>
    nmap <Leader>b [bufmru]

    nnoremap <silent> [bufmru]l  :BufMRU<CR>
    nnoremap <silent> [bufmru]B  :BufMRUPrev<CR>
    nnoremap <silent> [bufmru]b  :BufMRUNext<CR>
