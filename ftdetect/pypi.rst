``ftdetect/pypi.vim``
=====================

::

    " vint: -ProhibitAutocmdWithNoGroup
    autocmd BufNewFile,BufRead ~/.pypirc setfiletype FALLBACK dosini
    " vint: +ProhibitAutocmdWithNoGroup
