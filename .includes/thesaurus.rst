Enable thesaurus support; annoying in code, but great in prose.

::

    setlocal complete+=s
    execute 'let b:undo_ftplugin ' .
        \ (exists('b:undo_ftplugin') ? '.= "|' : '= "') .
        \ 'setlocal complete<"'
