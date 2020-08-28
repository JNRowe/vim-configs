Set useful defaults for formatting prose::

    setlocal formatoptions+=2
    execute 'let b:undo_ftplugin ' .
        \ (exists('b:undo_ftplugin') ? '.= "|' : '= "') .
        \ 'setlocal formatoptions<"'
    setlocal textwidth=72
    let b:undo_ftplugin .= '|setlocal textwidth<'

Add dictionary from miscfiles_ if available::

    if filereadable('/usr/share/dict/words')
        setlocal complete+=k/usr/share/dict/words
        let b:undo_ftplugin .= '|setlocal complete<'
    endif

.. _miscfiles: https://savannah.gnu.org/projects/miscfiles/
