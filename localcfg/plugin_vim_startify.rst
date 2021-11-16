``localcfg/plugin_vim_startify.vim``
====================================

.. include:: ../.includes/scriptencoding.rst

.. _vim-startify-intro:

Don’t run on startup so that we can resume previous editing session with ease::

    let g:startify_disable_at_vimenter = v:true

.. tip::

    A simple shell alias with ``vim +Startify`` is a simple way to make
    :command:`vim` open at the startify window.

Use a smaller decoration in the header, so that the important data is
immediately visible in short windows::

    let g:startify_custom_header = 'startify#center(startify#fortune#boxed())'

These common, to me, configuration files are reasonable bookmarks for when I've
started :command:`vim` without arguments, but perhaps others are more useful
when started with arguments?

::

    let s:git_config = filereadable(g:xdg_config_dir . '/git/config')
    \   ? g:xdg_config_dir . '/git/config'
    \   : '~/.gitconfig'
    let g:startify_bookmarks = [
    \   g:xdg_config_dir . '/awesome/rc.moon',
    \   g:xdg_config_dir . '/awesome/themes/jnrowe/theme.moon',
    \   s:git_config,
    \   '~/.vim/vimrc.rst',
    \   '~/.vim/vimrc-local',
    \   '~/.vim/dein.rst',
    \ ]

.. tip::

    This setting is a prime candidate for configuring using :ref:`localcfg
    <localcfg-config>`’s support for host specific configuration, such as
    :file:`localcfg/$HOST.vim`.

Define some quick commands to jump to help::

    let g:startify_commands = [
    \   ['Version', ':version'],
    \   ['Reference', ':help reference'],
    \   ['FAQ', ':help Vim-FAQ'],
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
    \   {'type': 'files', 'header': ['']},
    \   {'type': 'dir', 'header': ['']},
    \   {'type': 'sessions', 'header': ['']},
    \   {'type': 'commands', 'header': ['']},
    \   {'type': 'bookmarks', 'header': ['']},
    \ ]

We don’t need full filenames::

    let g:startify_relative_path = v:true

Configure sessions and start them automatically::

    let g:startify_session_autoload = v:true
    let g:startify_session_dir = g:vim_data_dir . '/sessions'
    let g:startify_session_sort = v:true

If :kbd:`<F1>` is help, shifting up a gear is actually starting::

    nnoremap <S-F1> :Startify<CR>

.. spelling::

    startify
    startup
