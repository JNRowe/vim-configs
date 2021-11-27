Set useful defaults for formatting prose::

    setlocal formatoptions+=2
    execute 'let b:undo_ftplugin ' .
        \ (exists('b:undo_ftplugin') ? '.= "|' : '= "') .
        \ 'setlocal formatoptions<"'

Add dictionary from miscfiles_ if available::

    if filereadable('/usr/share/dict/words')
        setlocal complete+=k/usr/share/dict/words
        let b:undo_ftplugin .= '|setlocal complete<'
    endif

.. tip::

    On Debian_ systems this file tends to be provided by packages from the
    wordlist_ project(see ``aptitude search '~Pwordlist'`` for options).  On
    other systems, and possibly on Debian too, it may be provided by GNU’s
    miscfiles_ package.

Break undo sequence on sentence level punctuation.  This kind of feels better
when editing prose and also when making liberal use of ``undo-tree``.  Not yet
sure if it is too granular.

::

    for s:key in split(',.!?:;', '\zs')
        execute 'inoremap <buffer> ' . s:key . ' ' . s:key . '<C-g>u'
    endfor

.. _miscfiles: https://savannah.gnu.org/projects/miscfiles/
.. _Debian: https://debian.org/
.. _wordlist: http://wordlist.sourceforge.net/
