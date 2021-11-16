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
    \             'Maps', 'Marks', 'Windows']
        execute 'nmap <silent> [fzf]' . tolower(s:cmd[0]) . ' ' .
        \   ':FZF' . s:cmd . '<CR>'
    endfor

.. seealso::

    * :func:`keymaps#mnemonic_map() <mnemonic_map>`

.. tip::

    I use :kbd:`grave` as my binding for :command:`fzf` commands to reflect my
    use of :kbd:`<Mod4-\`>` to open a drop down terminal in my window manager.
    The pattern here and throughout these configuration files is an extremely
    useful as a way to remember bindings.

.. rubric:: Footnotes

.. [#] By which I clearly mean “blindly tab complete”.
