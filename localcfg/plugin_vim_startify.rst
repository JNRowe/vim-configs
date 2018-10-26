``localcfg/plugin_vim_startify.vim``
====================================

These commonly edited config files are reasonable bookmarks for when I've
started vim without args, but perhaps others are more useful when started with
args?

.. code-block:: vim

    let g:startify_bookmarks = [
        \ g:xdg_config_dir . "/awesome/rc.moon",
        \ g:xdg_config_dir . "/awesome/themes/jnrowe/theme.moon",
        \ filereadable(g:xdg_config_dir . "/git/config") ? g:xdg_config_dir . "/git/config" : "~/.gitconfig",
        \ '~/.vim/vimrc',
        \ '~/.vim/vimrc-local',
        \ '~/.vim/dein.vim',
    \ ]

.. code-block:: vim

    let g:startify_commands = [
        \ ['Version', ':version'],
        \ ['Reference', ':help reference'],
        \ ['FAQ', ':help Vim-FAQ'],
    \ ]
    let g:startify_enable_special = v:false
    let g:startify_fortune_use_unicode = v:true

.. include:: ../.includes/fontawesome.rst

.. code-block:: vim

    " FIXME: Look at the commits example
    let g:startify_lists = [
        \ {'type': 'files', 'header': ['']},
        \ {'type': 'dir', 'header': ['']},
        \ {'type': 'sessions', 'header': ['']},
        \ {'type': 'commands', 'header': ['']},
        \ {'type': 'bookmarks', 'header': ['']},
    \ ]
    let g:startify_relative_path = v:true
    let g:startify_session_autoload = v:true
    let g:startify_session_dir = g:vim_data_dir . '/sessions'
    let g:startify_session_sort = v:true

.. code-block:: vim

    nnoremap <S-F1> :Startify<CR>
