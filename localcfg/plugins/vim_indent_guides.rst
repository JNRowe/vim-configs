``localcfg/plugins/vim_indent_guides.vim``
==========================================

.. include:: ../../.includes/scriptversion.rst

Configure styling::

    let g:indent_guides_auto_colors = v:false
    if has('gui_running')
        let g:indent_guides_guide_size = 1
        let g:indent_guides_start_level = 2
    endif
    let s:guide_gui = #{even: '#00ff00', odd: '#007700'}
    if &t_Co >= 88
        let s:guide_term = #{even: 240, odd: 236}
    else
        let s:guide_term = #{even: 8, odd: 0}
    endif
    augroup jnrowe_vim_indent_guides
        autocmd!
        for s:k in ['even', 'odd']
            execute printf('autocmd Colorscheme,VimEnter * ' .
            \              'highlight IndentGuides%s ctermbg=%s guibg=%s',
            \               misc#title_word(s:k), s:guide_term[s:k],
            \               s:guide_gui[s:k])
        endfor
    augroup END

.. seealso::

    * :func:`misc#title_word() <title_word>`

.. todo::

    These settings are incredibly dependent on the colour schemes being used.
    There must be a better way to handle it.

I’ve never switched guides off, so make it permanent::

    let g:indent_guides_enable_on_vim_startup = v:true

Highlights for read only buffers aren’t interesting::

    let g:indent_guides_exclude_filetypes = [
    \   'calendar',
    \   'gitmessengerpopup',
    \   'help',
    \   'man',
    \   'startify'
    \ ]
