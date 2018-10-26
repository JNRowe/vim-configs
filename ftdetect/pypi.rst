``ftdetect/pypi.vim``
=====================

.. code-block:: vim

    augroup jnrowe_ftdetect
        autocmd BufNewFile,BufRead ~/.pypirc setfiletype FALLBACK dosini
    augroup END
