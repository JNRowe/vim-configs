``after/ftplugin/mail.vim``
===========================

.. include:: ../../.includes/scriptencoding.rst

Add maps to insert `X-Advice headers`_.  Obviously we’re not going to convince
every one to take part, but they have become popular in work mail::

    call MnemonicMap('Advice', {'buffer': v:true, 'local': v:true})

    for s:prio in ['perhaps', 'should', 'must']
        for s:due in ['now', 'soon', 'whenever']
            execute 'nnoremap <buffer> <silent> [Advice]' . s:prio[0] . s:due[0] .
                \ ' mxgg/^$/<CR>iX-advice: ' . s:prio . ' read ' . s:due .
                \ '<CR><Esc>`x'
        endfor
    endfor

.. include:: ../../.includes/thesaurus.rst
.. include:: ../../.includes/prose.rst

.. _X-Advice headers: http://www.nicemice.net/amc/advice-header/
