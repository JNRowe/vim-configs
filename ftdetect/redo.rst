``ftdetect/redo.vim``
=====================

Detect redo_ files::

    " vint: -ProhibitAutocmdWithNoGroup
    autocmd BufRead,BufNewFile *.do set filetype=sh
    " vint: +ProhibitAutocmdWithNoGroup

.. warning::

    This doesn’t use ``FALLBACK`` as we *always* want to override ``vim``’s
    default detection in this case.  If you know what :wikipedia:`stata` is then
    you might not like this ;)

.. _redo: http://cr.yp.to/redo.html
