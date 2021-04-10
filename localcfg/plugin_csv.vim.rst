``localcfg/plugin_csv.vim``
===========================

If guessing fails default to ``,``::

    let g:csv_default_delim = ','

The displayed data when ``,`` is not the correct field separator makes it
immediately obvious.  Therefore defaulting to the most likely format is far more
useful than reading the warning and then setting it manually.
