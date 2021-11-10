``ftdetect/pypi.vim``
=====================

For simple usage ``dosini`` is useful for the PyPI configuration data::

    " vint: -ProhibitAutocmdWithNoGroup
    autocmd BufRead,BufNewFile ~/.pypirc setfiletype FALLBACK dosini
    " vint: +ProhibitAutocmdWithNoGroup

.. caution::

    Packages that use :file:`.pypirc` will process it with
    :class:`~configparser.RawConfigParser` which is far more powerful than the
    format defined by ``dosini``’s filetype, so be wary of trusting the
    highlighting too much.
