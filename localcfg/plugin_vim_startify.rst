``localcfg/plugin_vim_startify.vim``
====================================

.. include:: ../.includes/scriptencoding.rst

.. _vim-startify-intro:

Don’t run on startup so that we can resume previous editing session with ease::

    let g:startify_disable_at_vimenter = v:true

.. tip::

    A simple shell alias with :command:`vim +Startify` is a simple way to make
    |vim| open at the startify window.

Prefer a smaller decoration in the header, so that the important data is
immediately visible in windows::

    let g:startify_header_full = 'startify#center(startify#fortune#boxed())'

Only display the header when in large windows::

    augroup jnrowe_vim_startify
        autocmd!
        autocmd VimResized * if dein#get('vim-startify').sourced |
        \       call plugins#vim_startify#set_header_display() |
        \   endif
    augroup END

.. seealso::

    * :func:`plugins#vim_startify#set_header_display() <set_header_display>`

These common, to me, configuration files are reasonable bookmarks for when I've
started |vim| without arguments, but perhaps others are more useful when started
with arguments?

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

    This setting is a prime candidate for configuring using a :ref:`host
    specific configuration file <host_specific_file>`.

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

    nnoremap <silent> <S-F1> :Startify<CR>

.. spelling::

    startify
    startup
