Set useful defaults for formatting prose::

    setlocal formatoptions+=2
    execute 'let b:undo_ftplugin ' .
        \ (exists('b:undo_ftplugin') ? '.= "|' : '= "') .
        \ 'setlocal formatoptions<"'
    setlocal textwidth=72
    let b:undo_ftplugin .= '|setlocal textwidth<'

If par_ is available we’ll use it::

    if executable('par-format')
        setlocal formatprg=par-format\ -w72eq
        let b:undo_ftplugin .= '|setlocal formatprg<'
    elseif executable('par')
        setlocal formatprg=par\ -w72eq
        let b:undo_ftplugin .= '|setlocal formatprg<'
    endif

.. _par: http://www.nicemice.net/par/
