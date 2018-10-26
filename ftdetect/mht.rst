``ftdetect/mht.vim``
====================

.. code-block:: vim

    augroup jnrowe_ftdetect
        autocmd BufRead,BufNewFile *.mht setfiletype FALLBACK html
    augroup END
