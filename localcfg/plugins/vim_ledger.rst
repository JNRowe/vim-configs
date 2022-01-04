``localcfg/plugins/vim_ledger.vim``
===================================

.. include:: ../../.includes/scriptversion.rst

Use a lower than default column width to allow for larger expressions without
lines growing too much::

    let g:ledger_align_at = 44

.. note::

    44 was arrived at by :command:`grep`’ing ten years of |ledger| data, and
    adding 10% to the minimum *I* would need.  Your mileage may vary.

… but when you open a shared |ledger| file you may want to visually set it to
the current column::

    command! LedgerAlignHere let g:ledger_align_at = getcurpos()[2]

Use :wikipedia:`ISO-8601 <ISO_8601>` compatible date format::

    const g:ledger_date_format = '%F'

Configure magic currency completion in ledger files::

    if has('insert_expand')
        augroup jnrowe_vim_ledger
            autocmd!
            autocmd FileType ledger inoremap <silent> <Tab>
            \   <C-r>=ledger#autocomplete_and_align()<CR>
        augroup END
    endif

.. todo::

    This should be in addition to :kbd:`<Tab>`, not a replacement.

.. spelling::

    ing
