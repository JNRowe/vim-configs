``ftdetect/pypi.vim``
=====================

::

    " vint: -ProhibitAutocmdWithNoGroup
    autocmd BufRead,BufNewFile ~/.pypirc setfiletype FALLBACK dosini
    " vint: +ProhibitAutocmdWithNoGroup
