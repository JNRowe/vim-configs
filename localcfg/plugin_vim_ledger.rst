``localcfg/plugin_vim_ledger.vim``
==================================

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

    let g:ledger_date_format = '%F'

.. _vim-ledger-custom-maps:

Use my custom maps::

    call keymaps#mnemonic_map('Ledger', {'buffer': v:true, 'local': v:true})

    for [s:key, s:cmd] in [
    \   ['a', ':LedgerAlign'],
    \   ['d', 'align_amount_at_cursor()'],
    \   ['n', 'entry()'],
    \   ['s', 'transaction_state_toggle(line("."), " *?!")'],
    \   ['t', 'transaction_date_set(".", "auxiliary")'],
    \ ]
        if s:cmd[0] !=# ':'
            let s:cmd = 'call ledger#' . s:cmd
        else
            let s:cmd = s:cmd[1:]
        endif

        execute 'autocmd Filetype ledger nnoremap <silent> [Ledger]' .
        \   s:key . ' :' . s:cmd . '<CR>'
    endfor

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
