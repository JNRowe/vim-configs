``after/ftplugin/mail.vim``
===========================

.. include:: ../../.includes/scriptencoding.rst

.. _mail-custom-maps:

Add maps to insert `X-Advice headers`_.  Obviously we’re not going to convince
every one to take part, but they have become popular in work mail::

    call misc#mnemonicmap('Advice', {'buffer': v:true, 'local': v:true})

    for s:prio in ['perhaps', 'should', 'must']
        for s:due in ['now', 'soon', 'whenever']
            execute 'nnoremap <buffer> <silent> ' .
                \ '[Advice]' . s:prio[0] . s:due[0] .
                \ ' mxgg/^$/<CR>iX-advice: ' . s:prio . ' read ' . s:due .
                \ '<CR><Esc>`x'
        endfor
    endfor

.. include:: ../../.includes/thesaurus.rst
.. include:: ../../.includes/prose.rst

Kill from current line to signature, as a quick way to scrub large chunks of
quoted text::

    function! s:kill_to_signature() abort
        let l:sig = search('^-- $', 'cnW')
        if l:sig != 0
            execute line('.') . ',' . (l:sig - 1) . 'd "_'
        else
            let v:warningmsg = 'Signature not found!'
            echohl WarningMsg
            echomsg v:warningmsg
            echohl none
        endif
    endfunction
    inoremap <silent> <C-k> <C-o>:call <SID>kill_to_signature()<CR>
    nnoremap <silent> <C-k> :call <SID>kill_to_signature()<CR>

.. _X-Advice headers: http://www.nicemice.net/amc/advice-header/
