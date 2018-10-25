``after/ftplugin/mail.vim``
===========================

.. include:: ../../.includes/scriptencoding.rst

.. code-block:: vim

    call MnemonicMap('Advice', {'buffer': v:true, 'local': v:true})

    for s:prio in ['perhaps', 'should', 'must']
        for s:due in ['now', 'soon', 'whenever']
            execute 'nnoremap <buffer> <silent> [Advice]' . s:prio[0] . s:due[0] .
                \ ' mxgg/^$/<CR>iX-advice: ' . s:prio . ' read ' . s:due .
                \ '<CR><Esc>`x'
        endfor
    endfor

.. code-block:: vim

    setlocal complete+=s
    setlocal formatoptions+=2a
    setlocal textwidth=72

.. code-block:: vim

    if executable('par-format')
        setlocal formatprg=par-format\ -w72eq
    elseif executable('par')
        setlocal formatprg=par\ -w72eq
    endif
