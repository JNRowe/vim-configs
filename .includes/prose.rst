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

Break undo sequence on sentence level punctuation.  This kind of feels better
when editing prose and also when making liberal use of ``undo-tree``.  Not yet
sure if it is too granular.

::

    for s:key in split(',.!?:;', '\zs')
        execute 'inoremap <buffer> ' . s:key . ' ' . s:key . '<C-g>u'
    endfor

.. _miscfiles: https://savannah.gnu.org/projects/miscfiles/
