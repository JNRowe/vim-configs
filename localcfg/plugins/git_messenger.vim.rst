``localcfg/plugins/git_messenger.vim.vim``
==========================================

.. include:: ../../.includes/scriptversion.rst

Use |ISO-8601| compatible date format::

    let g:git_messenger_date_format = '%FT%T'

Don’t automatically close window::

    let g:git_messenger_close_on_cursor_moved = v:false

Use scrollwheel, or emulated key, to move through history in window::

    augroup jnrowe_git_messenger
        autocmd!
        autocmd FileType gitmessengerpopup
        \   nmap <buffer> <ScrollWheelDown> o <Bar>
        \   nmap <buffer> <ScrollWheelUp> O
    augroup END

.. spelling::

    scrollwheel
