``after/ftplugin/mail.vim``
===========================

.. include:: ../../.includes/scriptencoding.rst

.. _mail-custom-maps:

Add maps to insert `X-Advice headers`_.  Obviously we’re not going to convince
every one to take part, but they have become popular in work mail.

::

    call keymaps#mnemonic_map('Advice',
    \                         {'buffer': v:true, 'key': 'A', 'local': v:true})
    for s:prio in ['perhaps', 'should', 'must']
        for s:due in ['now', 'soon', 'whenever']
            execute 'nnoremap <silent> <buffer> ' .
            \   '[Advice]' . s:prio[0] . s:due[0] .
            \   ' :call filetypes#add_advice_header("' . s:prio . '", "' .
            \   s:due . '")<CR>'
        endfor
    endfor

.. seealso::

    * :func:`keymaps#mnemonic_map() <mnemonic_map>`

.. include:: ../../.includes/thesaurus.rst
.. include:: ../../.includes/prose.rst

Kill from current line to signature, as a quick way to scrub large chunks of
quoted text::

    inoremap <silent> <C-k> <C-o>:call filetypes#kill_to_signature()<CR>
    nnoremap <silent> <C-k> :call filetypes#kill_to_signature()<CR>

.. seealso::

    * :func:`filetypes#kill_to_signature() <kill_to_signature>`

.. _X-Advice headers: http://www.nicemice.net/amc/advice-header/
