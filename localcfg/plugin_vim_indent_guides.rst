``localcfg/plugin_vim_indent_guides.vim``
=========================================

These settings are incredibly dependent on the colour schemes being used

.. code-block:: vim

    if has('gui_running')
        let g:indent_guides_color_change_percent = 7
    else
        let g:indent_guides_auto_colors = v:false
        if &t_Co >= 88
            hi IndentGuidesOdd  ctermbg=236
            hi IndentGuidesEven ctermbg=240
        else
            hi IndentGuidesOdd  ctermbg=0
            hi IndentGuidesEven ctermbg=8
        endif
    endif

.. code-block:: vim

    let g:indent_guides_enable_on_vim_startup = v:true
    let g:indent_guides_exclude_filetypes = ['help', 'man']
