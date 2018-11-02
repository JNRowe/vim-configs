``localcfg/plugin_delimitMate.vim``
===================================

Support multiline strings in nim_ and Python_::

    augroup jnrowe_delimitMate
        autocmd!
        autocmd FileType nim,python let b:delimitMate_nesting_quotes = ['"']
    augroup END

.. _nim: https://nim-lang.org/
.. _Python: https://www.python.org/
