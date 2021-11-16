``localcfg/plugin_git_messenger.vim.vim``
=========================================

.. _git-messenger-vim-custom-maps:

Use my custom maps::

    let g:git_messenger_no_default_mappings = v:true

    call keymaps#mnemonic_map('messenger')

    for [s:key, s:cmd] in [
    \   ['o',          ''],
    \   ['c',          '-close'],
    \   ['i',          '-into-popup'],
    \   ['<Down>',     '-scroll-down-1'],
    \   ['<Up>',       '-scroll-up-1'],
    \   ['<PageDown>', '-scroll-down-page'],
    \   ['<PageUp>',   '-scroll-up-page'],
    \ ]
        execute 'nmap <silent> [messenger]' . s:key .
        \   ' <Plug>(git-messenger' . s:cmd . ')'
    endfor

.. seealso::

    * :func:`keymaps#mnemonic_map() <mnemonic_map>`

Use :wikipedia:`ISO-8601 <ISO_8601>` compatible date format::

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
