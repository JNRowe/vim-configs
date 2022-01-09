``localcfg/plugins/editorconfig_vim.vim``
=========================================

.. include:: ../../.includes/scriptversion.rst

Use the faster :repo:`C version <editorconfig/editorconfig-core-c>` when
available::

    if executable('editorconfig')
        const g:EditorConfig_core_mode = 'external_command'
        const g:EditorConfig_exec_path = exepath('editorconfig')
    endif

We manage ``'colorcolumn'`` in :ref:`settings.vim <colorcolumn-config>`, so
disable this plugin’s support::

    const g:EditorConfig_max_line_indicator = 'none'

Ignore :repo:`fugitive <tpope/vim-fugitive>` buffers::

    const g:EditorConfig_exclude_patterns = ['fugitive://.\*']
