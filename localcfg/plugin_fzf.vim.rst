``localcfg/plugin_fzf.vim.vim``
===============================

Without a prefix the exported commands shadow other plugins, and are far harder
to remember [#]_.

::

    let g:fzf_command_prefix = 'FZF'

Jump to existing windows when possible::

    let g:fzf_buffers_jump = 1

.. _fzf-vim-custom-maps:

Configure convenience mappings for common command usage::

    call keymaps#mnemonic_map('fzf', {'key': '`'})
    for s:cmd in ['Ag', 'Buffers', 'Commands', 'Files', 'GFiles', 'Lines',
        \         'Maps', 'Marks', 'Windows']
        execute 'nmap <silent> [fzf]' . tolower(s:cmd[0]) . ' ' .
        \   ':FZF' . s:cmd . '<CR>'
    endfor

.. rubric:: Footnotes

.. [#] By which I clearly mean “blindly tab complete”.
