``localcfg/plugin_vim_ledger.vim``
==================================

Use a shorter than default column width to allow for larger expressions
without pushing lines too long::

    let g:ledger_align_at = 44

.. note::

    44 was arrived at by :command:`grep`’ing ten years of ledger_ data, and
    adding 10% to the minimum *I* would need.  Your mileage may vary.

… but when you open a shared ledger_ file you may want to visually set it to the
current column::

    command! LedgerAlignHere let g:ledger_align_at = getcurpos()[2]

Use :wikipedia:`ISO-8601 <ISO_8601>` compatible date format::

    let g:ledger_date_format = '%F'

Use my custom maps::

    call MnemonicMap('Ledger', {'buffer': v:true, 'local': v:true})

    for [s:key, s:cmd] in [
        \   ['a',       ':LedgerAlign'],
        \   ['d',       'align_amount_at_cursor()'],
        \   ['n',       'entry()'],
        \   ['s',       'transaction_state_toggle(line("."), " *?!")'],
        \   ['t',       'transaction_date_set(".", "auxiliary")'],
        \ ]
        if s:cmd[0] !=# ':'
            let s:cmd = 'call ledger#' . s:cmd
        else
            let s:cmd = s:cmd[1:]
        endif

        execute 'autocmd Filetype ledger nnoremap <silent> [Ledger]' .
            \ s:key . ' :' . s:cmd . '<CR>'
    endfor

Configure magic currency completion in ledger files::

    augroup jnrowe_vim_ledger
        autocmd FileType ledger inoremap <silent> <Tab>
            \ <C-r>=ledger#autocomplete_and_align()<CR>
    augroup END

.. _ledger: https://www.ledger-cli.org/
