Leader maps
===========

This set of configuration files layers its ``<Leader>`` and ``<LocalLeader>``
maps using :func:`mnemonic_map`.  The configured bindings are:

=========  =====  ======  ====================================================
Key        Local  Buffer  Maps
=========  =====  ======  ====================================================
:kbd:`?`   ❌     ❌      :ref:`vim help <help-custom-maps>`
:kbd:`\``  ❌     ❌      :ref:`fzf.vim <fzf-vim-custom-maps>`
:kbd:`a`   ✅     ✅      :ref:`mail filetype <mail-custom-maps>`
:kbd:`D`   ✅     ❌      :ref:`display tools <display-custom-maps>`
:kbd:`a`   ✅     ❌      :ref:`ale <ale-custom-maps>`
:kbd:`b`   ❌     ❌      :ref:`vim-bufmru <vim-bufmru-custom-maps>`
:kbd:`c`   ❌     ❌      :ref:`calendar <calendar-vim-custom-maps>`
:kbd:`d`   ❌     ❌      :ref:`dwm <dwm-custom-maps>`
:kbd:`f`   ✅     ❌      :ref:`+quickfix feature <quickfix-custom-maps>`
:kbd:`g`   ❌     ❌      :ref:`vim-gitgutter <vim-gitgutter-custom-maps>`
:kbd:`h`   ✅     ❌      :ref:`haskell filetype <haskell-custom-maps>`
:kbd:`h`   ✅     ✅      :ref:`rst filetype <rst-custom-maps>`
:kbd:`i`   ✅     ❌      :ref:`+diff feature <diff-custom-maps>`
:kbd:`l`   ✅     ✅      :ref:`vim-ledger <vim-ledger-custom-maps>`
:kbd:`l`   ✅     ❌      :ref:`location list <location-list-custom-maps>`
:kbd:`m`   ❌     ❌      :ref:`git-messenger.vim
                          <git-messenger-vim-custom-maps>`
:kbd:`p`   ✅     ❌      :ref:`vim-quick-radon <vim-quick-radon-custom-maps>`
:kbd:`r`   ✅     ✅      :ref:`gitrebase <gitrebase-custom-maps>`
:kbd:`s`   ✅     ❌      :ref:`sideways.vim <sideways-vim-custom-maps>`
:kbd:`t`   ✅     ✅      :ref:`gitcommit filetype <gitcommit-custom-maps>`
:kbd:`v`   ✅     ❌      :ref:`vim-vebugger <vim-vebugger-custom-maps>`
:kbd:`w`   ❌     ❌      :ref:`wordnet.vim <wordnet-vim-custom-maps>`
=========  =====  ======  ====================================================

.. tip::

    :func:`mnemonic_map` adds a :kbd:`?` map to all groups that will show a list
    of defined mappings.
