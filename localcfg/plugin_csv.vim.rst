``localcfg/plugin_csv.vim.vim``
===============================

When guessing delimiters fails assume comma::

    let g:csv_default_delim = ','

The displayed data when comma is not the correct field separator makes it
immediately obvious.  Therefore defaulting to the most likely format is far more
useful than reading the warning and then setting it manually.

Use strict column mode as the default::

    let g:csv_strict_columns = v:true

.. note::

    While the non-strict mode is useful in certain cases, it is easy to
    ``unlet`` this when the need arises.
