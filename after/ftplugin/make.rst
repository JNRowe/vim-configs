``after/ftplugin/make.vim``
===========================

``smarttab`` is *amazingly* useful everywhere a :kbd:`<Tab>` isn’t a surprise
waiting to happen, such as a :file:`Makefile`::

    setlocal nosmarttab
    execute 'let b:undo_ftplugin ' .
        \ (exists('b:undo_ftplugin') ? '.= "|' : '= "') .
        \ 'setlocal smarttab<"'
