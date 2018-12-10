``after/ftplugin/xml.vim``
==========================

::

    setlocal omnifunc=htmlcomplete#CompleteTags
    execute 'let b:undo_ftplugin ' .
        \ (exists('b:undo_ftplugin') ? '.= "|' : '= "') .
        \ 'setlocal omnifunc<"'
