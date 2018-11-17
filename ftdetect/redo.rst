``ftdetect/redo.vim``
=====================

::

    augroup jnrowe_ftdetect
        autocmd BufRead,BufNewFile *.do setfiletype sh
        autocmd BufRead,BufNewFile *.do let g:is_posix=1
    augroup END

.. warning::

    This doesn’t use ``FALLBACK`` as we *always* want to override ``vim``’s
    default detection in this case.  If you know what :wikipedia:`stata` is you
    might not like this ;)
