``localcfg/plugin_vim_indent_guides.vim``
=========================================

Configure styling::

    let g:indent_guides_auto_colors = v:false
    if has('gui_running')
        let g:indent_guides_guide_size = 1
        let g:indent_guides_start_level = 2
        hi IndentGuidesOdd guibg=#007700
        hi IndentGuidesEven guibg=#00ff00
    else
        if &t_Co >= 88
            hi IndentGuidesOdd  ctermbg=236
            hi IndentGuidesEven ctermbg=240
        else
            hi IndentGuidesOdd  ctermbg=0
            hi IndentGuidesEven ctermbg=8
        endif
    endif

.. todo::

    These settings are incredibly dependent on the colour schemes being
    used.  There must be a better way to handle it.

I’ve never toggled guides off, so make it permanent::

    let g:indent_guides_enable_on_vim_startup = v:true

Highlights for read only buffers aren’t interesting::

    let g:indent_guides_exclude_filetypes = ['help', 'man']
