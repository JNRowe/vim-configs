``localcfg/plugin_editorconfig_vim.vim``
========================================

Use the faster :repo:`C version <editorconfig/editorconfig-core-c>`::

    let g:EditorConfig_core_mode = 'external_command'

We manage ``colorcolumn`` in :doc:`../vimrc.d/settings`, so disable this
plugin’s support::

    let g:EditorConfig_max_line_indicator = 'none'

Ignore :repo:`fugitive <tpope/vim-fugitive>` buffers::

    let g:EditorConfig_exclude_patterns = ['fugitive://.\*']
