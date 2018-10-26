``localcfg/plugin_sideways.vim.vim``
====================================

.. code-block:: vim

    nnoremap [sideways] <Nop>
    nmap <LocalLeader>s [sideways]

    for s:key in ['Left', 'Right']
        execute 'nnoremap <silent> [sideways]<' . s:key . '>' .
            \ ' :<C-u>Sideways' . s:key . '<CR>'
        execute 'nnoremap <silent> [sideways]<S-' . s:key . '>' .
            \ ' :<C-u>SidewaysJump' . s:key . '<CR>'
    endfor
