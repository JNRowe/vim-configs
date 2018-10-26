``localcfg/plugin_gundo.vim.vim``
=================================

.. code-block:: vim

    nnoremap <LocalLeader># :GundoToggle<CR>

.. code-block:: vim

    let g:gundo_help = v:false
    let g:gundo_width = 30
    let g:gundo_preview_bottom = v:true
    let g:gundo_right = v:true

.. code-block:: vim

    if has('python3')
        let g:gundo_prefer_python3 = v:true
    endif
