``localcfg/plugins/fzf.vim.vim``
================================

.. include:: ../../.includes/scriptversion.rst

Without a prefix the exported commands shadow other plugins, and are far harder
to remember [#]_.

::

    let g:fzf_command_prefix = 'FZF'

Jump to existing windows when possible::

    let g:fzf_buffers_jump = 1

.. rubric:: Footnotes

.. [#] By which I clearly mean “blindly tab complete”.
