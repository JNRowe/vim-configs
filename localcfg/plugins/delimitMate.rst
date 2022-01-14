``localcfg/plugins/delimitMate.vim``
====================================

.. include:: ../../.includes/scriptversion.rst

Support multiline strings in nim_::

    augroup jnrowe_delimitMate
        autocmd!
        autocmd FileType nim let b:delimitMate_nesting_quotes = ['"']
    augroup END

.. _nim: https://nim-lang.org/
