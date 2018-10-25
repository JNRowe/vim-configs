``ftdetect/editorconfig.vim``
=============================

.. code-block:: vim

    augroup jnrowe_ftdetect
        autocmd BufRead,BufNewFile .editorconfig setfiletype dosini
    augroup END
