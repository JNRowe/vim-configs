``after/ftplugin/gitcommit.vim``
================================

.. include:: ../../.includes/scriptencoding.rst

.. _gitcommit-custom-maps:

Configure maps to insert common metadata in to commit messages::

    call keymaps#mnemonic_map('Trailer', {'buffer': v:true, 'local': v:true})

    for s:type in ['Acked', 'Co-authored', 'Reviewed', 'Signed-off', 'Tested']
        execute 'nnoremap <silent> <buffer> [Trailer]' . tolower(s:type[0]) .
        \   ' :call filetypes#add_git_trailer("' . s:type . '", ' .
        \                                     '"' . g:user_email . '")<CR>'
        execute 'nnoremap <silent> <buffer> [Trailer]q' . tolower(s:type[0]) .
        \   ' :call filetypes#add_git_trailer("' . s:type . '")<CR>'
    endfor

.. seealso::

    * :func:`keymaps#mnemonic_map() <mnemonic_map>`
    * :func:`filetypes#add_git_trailer() <add_git_trailer>`

.. tip::

    This adds two bindings for each type.  For example, using
    :kbd:`[trailer]a` with add an ``Acked-by`` trailer with the
    :ref:`default user <default-user-identifier>`, whereas the
    :kbd:`[trailer]qa` binding will **q**\uery for the user data.

.. todo:: Add screenshot for query mode

Add a mapping for Sponsored-by_ header::

    nnoremap <silent> <buffer> [Trailer]qp
    \   :call filetypes#add_git_trailer('Sponsored')<CR>

.. seealso::

    * :func:`filetypes#add_git_trailer() <add_git_trailer>`

.. _gitcommit-emoji-commits:

A few co-workers are now decorating their commits with emojis for expressing
their types, and I’ll *try* to do so when committing to those projects::

    for [s:key, s:char] in [['new', '🌟'], ['del', '❌'], ['fix', '🐛'],
    \                       ['ref', '⟳'], ['tool', '🔨']]
        silent execute 'iabbrev <buffer> _' . s:key . ' ' . s:char
    endfor

.. _Sponsored-by: https://blog.liw.fi/posts/2021/05/26/sponsored-by/

.. spelling::

    uery
