``after/ftplugin/gitcommit.vim``
================================

.. include:: ../../.includes/scriptencoding.rst

.. _gitcommit-custom-maps:

Configure maps to insert common metadata in to commit messages::

    call misc#mnemonicmap('Trailer', {'buffer': v:true, 'local': v:true})

    for s:type in ['Acked', 'Co-authored', 'Reviewed', 'Signed-off', 'Tested']
        execute 'nnoremap <buffer> <silent> [Trailer]' . tolower(s:type[0]) .
            \ ' :call misc#add_git_trailer("' . s:type . '", ' .
            \                              '"' . g:user_email . '")<CR>'
        execute 'nnoremap <buffer> <silent> [Trailer]q' . tolower(s:type[0]) .
            \ ' :call misc#add_git_trailer("' . s:type . '")<CR>'
    endfor

.. note::

    This adds two bindings for each type.  For example, using ``[trailer]a``
    with add an ``Acked-by`` trailer with the :ref:`default user
    <default-user-identifier>`, whereas ``[trailer]qa`` binding will **q**\uery
    for the user.

Add a mapping for Sponsored-by_ header::

    nnoremap <buffer> <silent> [Trailer]qp
        \ :call misc#add_git_trailer('Sponsored')<CR>

.. _gitcommit-emoji-commits:

A few co-workers are now decorating their commits with emojis for expressing
their types, and I’ll *try* to do so when committing to them::

    for [s:key, s:char] in [['new', '🌟'], ['del', '❌'], ['fix', '🐛'],
        \                   ['ref', '⟳'], ['tool', '🔨']]
        silent execute 'iabbrev <buffer> _' . s:key . ' ' . s:char
    endfor

.. _Sponsored-by: https://blog.liw.fi/posts/2021/05/26/sponsored-by/
