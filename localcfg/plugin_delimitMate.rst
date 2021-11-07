``localcfg/plugin_delimitMate.vim``
===================================

Support multiline strings in nim_ and |Python|::

    augroup jnrowe_delimitMate
        autocmd!
        autocmd FileType nim,python let b:delimitMate_nesting_quotes = ['"']
    augroup END

.. _nim: https://nim-lang.org/
