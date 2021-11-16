``localcfg/plugin_editorconfig_vim.vim``
========================================

Use the faster :repo:`C version <editorconfig/editorconfig-core-c>` when
available::

    if executable('editorconfig')
        let g:EditorConfig_core_mode = 'external_command'
        let g:EditorConfig_exec_path = 'editorconfig'
    endif

We manage ``'colorcolumn'`` in :ref:`settings.vim <colorcolumn-config>`, so
disable this plugin’s support::

    let g:EditorConfig_max_line_indicator = 'none'

Ignore :repo:`fugitive <tpope/vim-fugitive>` buffers::

    let g:EditorConfig_exclude_patterns = ['fugitive://.\*']
