``localcfg/plugin_delimitMate.vim``
===================================

.. code-block:: vim

    augroup jnrowe_delimitMate
        autocmd!
        autocmd FileType nim,python let b:delimitMate_nesting_quotes = ['"']
    augroup END
