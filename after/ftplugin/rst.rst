``after/ftplugin/rst.vim``
==========================

.. _rst-custom-maps:

::

    call misc#MnemonicMap('Heading', {'buffer': v:true, 'local': v:true})

This creates reST_ headings using *my* favourite definitions of ``=``, ``-`` and
``'``::

    for [s:key, s:sym] in [['1', '='], ['2', '-'], ['3', "'"]]
        for [s:cmd, s:post] in [
            \ ['', 'o<Esc>.'],
            \ ['s', 'k'],
        \ ]
            execute 'nnoremap <buffer> <silent> [Heading]' . s:cmd . s:key .
                \ ' yypVr' . s:sym . s:post
        endfor
    endfor

.. include:: ../../.includes/prose.rst

.. include:: ../../.includes/thesaurus.rst

Break undo sequence on sentence level punctuation.  This kind of feels better
when editing prose and also when making liberal use of ``undo-tree``.  Not yet
sure if it is too granular.

::

    for s:key in split(',.!?:;', '\zs')
        execute 'inoremap <buffer> ' . s:key . ' ' . s:key . '<C-g>u'
    endfor

Enable common — to me — highlighting support::

    let g:rst_syntax_code_list = {
        \ 'cpp': ['cpp', 'c++'],
        \ 'lisp': ['emacs', 'lisp'],
        \ 'python': ['python'],
        \ 'sh': ['sh', 'zsh'],
        \ 'vim': ['vim'],
    \ }
    let g:rst_use_emphasis_colors = v:true

The *vast* majority of the time I spend editing reST_ documents I am actually
editing files from a Sphinx_ project.  It would be nice if I could ``gf`` when
in a ``:doc:`` role or ``toctree`` directive::

    setlocal suffixesadd+=.rst

.. _reST: http://docutils.sourceforge.net/rst.html
.. _Sphinx: http://sphinx-doc.org/
