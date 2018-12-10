``after/ftplugin/c.vim``
========================

Use ``:make`` to compile C/C++, even without a Makefile

::

    if !filereadable('Makefile')
        setlocal makeprg=gcc\ -o\ %<\ %
        execute 'let b:undo_ftplugin ' .
            \ (exists('b:undo_ftplugin') ? '.= "|' : '= "') .
            \ 'setlocal makeprg<"'
    endif
