``localcfg/plugins/vim_indent_guides.vim``
==========================================

.. include:: ../../.includes/scriptversion.rst

Configure styling::

    const g:indent_guides_auto_colors = v:false
    const g:indent_guides_guide_size = 1
    const g:indent_guides_start_level = 2
    const s:guide_gui = #{even: '#00ff00', odd: '#007700'}
    if &t_Co >= 88
        const s:guide_term = #{even: 240, odd: 236}
    else
        const s:guide_term = #{even: 8, odd: 0}
    endif
    augroup jnrowe_vim_indent_guides
        autocmd!
        for s:k in ['even', 'odd']
            execute printf('autocmd Colorscheme,VimEnter * ' ..
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

    const g:indent_guides_enable_on_vim_startup = v:true

Highlights for read only buffers aren’t interesting::

    const g:indent_guides_exclude_filetypes = [
    \   'calendar',
    \   'gitmessengerpopup',
    \   'help',
    \   'man',
    \   'startify'
    \ ]
