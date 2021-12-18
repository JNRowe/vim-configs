``after/ftplugin/gitcommit.vim``
================================

.. include:: ../../.includes/scriptencoding.rst

Switch to insert mode immediately when opening a new commit message::

    augroup jnrowe_gitcommit
        autocmd!
        autocmd BufEnter */COMMIT_EDITMSG if len(getline('.')) == 0 |
        \       startinsert |
        \   endif
    augroup END

.. note::

    The assumption here is that if the first line is blank this is a new commit
    message, otherwise we’re amending a previous message.  This may fail if you
    use a custom commit template.

.. _gitcommit-custom-maps:

Configure maps to insert common metadata in to commit messages::

    call keymaps#mnemonic_map('Trailer', {'buffer': v:true, 'local': v:true})

    for s:type in ['Acked', 'Co-authored', 'Reviewed', 'Signed-off', 'Tested']
        execute printf('nnoremap <silent> <buffer> [Trailer]%s ' .
        \              ':call filetypes#add_git_trailer("%s", "%s")<CR>',
        \              tolower(s:type[0]), s:type, g:user_email)
        execute printf('nnoremap <silent> <buffer> [Trailer]q%s ' .
        \              ':call filetypes#add_git_trailer("%s")<CR>',
        \              tolower(s:type[0]), s:type)
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

.. include:: ../../.includes/gitcommit_emoji.rst

.. _Sponsored-by: https://blog.liw.fi/posts/2021/05/26/sponsored-by/

.. spelling::

    uery
