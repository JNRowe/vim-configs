``ftdetect/redo.vim``
=====================

::

    " vint: -ProhibitAutocmdWithNoGroup
    autocmd BufRead,BufNewFile *.do setfiletype sh
    autocmd BufRead,BufNewFile *.do let g:is_posix=1
    " vint: +ProhibitAutocmdWithNoGroup

.. warning::

    This doesn’t use ``FALLBACK`` as we *always* want to override ``vim``’s
    default detection in this case.  If you know what :wikipedia:`stata` is then
    you might not like this ;)
