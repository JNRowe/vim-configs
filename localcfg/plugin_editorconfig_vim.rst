``localcfg/plugin_editorconfig_vim.vim``
========================================

Use the faster `C version`_::

    let g:EditorConfig_core_mode = 'external_command'

We manage ``colorcolumn`` in :doc:`../vimrc.d/settings`, so disable this
plugin’s support::

    let g:EditorConfig_max_line_indicator = 'none'

Ignore fugitive_ buffers::

    let g:EditorConfig_exclude_patterns = ['fugitive://.\*']

.. _C version: https://github.com/editorconfig/editorconfig-core-c/
.. _fugitive: https://github.com/tpope/vim-fugitive/
