``localcfg/plugin_gundo.vim.vim``
=================================

::

    nnoremap <LocalLeader># :GundoToggle<CR>

Configure look::

    let g:gundo_help = v:false
    let g:gundo_width = 30
    let g:gundo_preview_bottom = v:true
    let g:gundo_right = v:true

If Python_ 3 is available use it::

    if has('python3')
        let g:gundo_prefer_python3 = v:true
    endif

.. _Python: https://www.python.org/
