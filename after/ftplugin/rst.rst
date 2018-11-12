``after/ftplugin/rst.vim``
==========================

::

    call MnemonicMap('Heading', {'buffer': v:true, 'local': v:true})

This creates reST headings using *my* favourite definitions of ``=``, ``-`` and
``'``::

    for [s:key, s:sym] in [['1', '='], ['2', '-'], ['3', "'"]]
        for [s:cmd, s:post] in [
            \ ['', 'o<Esc>.'],
            \ ['s', 'k'],
        \ ]
            execute 'nnoremap <buffer> <silent> [Heading]' . s:cmd . s:key .
                \ ' yyp<C-v>$r' . s:sym . s:post
        endfor
    endfor

.. include:: ../../.includes/thesaurus.rst

Break undo sequence on sentence level punctuation.  This kind of feels better
when editing prose and also making liberal use of ``undo-tree``.  Not yet sure
if it is too granular.

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
