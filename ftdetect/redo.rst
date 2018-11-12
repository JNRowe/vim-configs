``ftdetect/redo.vim``
=====================

::

    augroup jnrowe_ftdetect
        autocmd BufRead,BufNewFile *.do setfiletype FALLBACK sh
        autocmd BufRead,BufNewFile *.do let g:is_posix=1
    augroup END
