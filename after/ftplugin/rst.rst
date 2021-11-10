``after/ftplugin/rst.vim``
==========================

.. _rst-custom-maps:

::

    call keymaps#mnemonic_map('Heading', {'buffer': v:true, 'local': v:true})

This creates |reST| headings using *my* favourite adornments::

    for [s:key, s:sym] in [['1', '='], ['2', '-'], ['3', "'"]]
        for [s:cmd, s:post] in [
        \   ['', 'o<Esc>.'],
        \   ['s', 'k'],
        \ ]
            execute 'nnoremap <buffer> <silent> [Heading]' . s:cmd . s:key .
            \   ' yypVr' . s:sym . s:post
        endfor
    endfor

.. include:: ../../.includes/prose.rst

.. include:: ../../.includes/thesaurus.rst

Enable common — to me — highlighting support::

    let g:rst_syntax_code_list = {
    \   'cpp': ['cpp', 'c++'],
    \   'lisp': ['emacs', 'lisp'],
    \   'python': ['python'],
    \   'sh': ['sh', 'zsh'],
    \   'vim': ['vim'],
    \ }
    let g:rst_use_emphasis_colors = v:true

The *vast* majority of the time I spend editing |reST| documents I am actually
editing files from a Sphinx_ project.  It is nice being able to :kbd:`gf` when
in a ``:doc:`` role or ``toctree`` directive::

    setlocal suffixesadd+=.rst
    let b:undo_ftplugin .= '|setlocal suffixesadd<'

.. _Sphinx: http://sphinx-doc.org/
