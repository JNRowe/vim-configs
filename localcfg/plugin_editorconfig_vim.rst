``localcfg/plugin_editorconfig_vim.vim``
========================================

We manage ``colorcolumn`` in :ref:`settings.vim <colorcolumn-config>`, so
disable this plugin’s support::

    let g:EditorConfig_max_line_indicator = 'none'

Ignore :repo:`fugitive <tpope/vim-fugitive>` buffers::

    let g:EditorConfig_exclude_patterns = ['fugitive://.\*']
