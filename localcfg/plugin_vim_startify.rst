``localcfg/plugin_vim_startify.vim``
====================================

These commonly [to me] edited config files are reasonable bookmarks for when
I've started :command:`vim` without arguments, but perhaps others are more
useful when started with arguments?

.. code-block:: vim

    let g:startify_bookmarks = [
        \ g:xdg_config_dir . "/awesome/rc.moon",
        \ g:xdg_config_dir . "/awesome/themes/jnrowe/theme.moon",
        \ filereadable(g:xdg_config_dir . "/git/config") ? g:xdg_config_dir . "/git/config" : "~/.gitconfig",
        \ '~/.vim/vimrc',
        \ '~/.vim/vimrc-local',
        \ '~/.vim/dein.vim',
    \ ]

Define some quick commands to jump to help::

    let g:startify_commands = [
        \ ['Version', ':version'],
        \ ['Reference', ':help reference'],
        \ ['FAQ', ':help Vim-FAQ'],
    \ ]

.. tip::

    Try hopping in to ``reference`` or ``FAQ`` when waiting for a build, it is
    a great way to learn something new or refresh the mind a little.

Disable unused commands::

    let g:startify_enable_special = v:false

Use fancy boxes for fortunes::

    let g:startify_fortune_use_unicode = v:true

.. include:: ../.includes/fontawesome.rst

Configure default chunks with fancy symbols::

    let g:startify_lists = [
        \ {'type': 'files', 'header': ['']},
        \ {'type': 'dir', 'header': ['']},
        \ {'type': 'sessions', 'header': ['']},
        \ {'type': 'commands', 'header': ['']},
        \ {'type': 'bookmarks', 'header': ['']},
    \ ]

We don’t need full filenames::

    let g:startify_relative_path = v:true

Configure sessions and start them automatically::

    let g:startify_session_autoload = v:true
    let g:startify_session_dir = g:vim_data_dir . '/sessions'
    let g:startify_session_sort = v:true

If :kbd:`<F1>` is help, shifting up a gear is actually starting::

    nnoremap <S-F1> :Startify<CR>
