``localcfg/quickfix.vim``
=========================

.. include:: ../.includes/scriptencoding.rst

.. _quickfix-custom-maps:

Configure my custom maps for quickfix::

    call keymaps#mnemonic_map('quickfix', {'key': 'f', 'local': v:true})

.. seealso::

    * :func:`keymaps#mnemonic_map() <mnemonic_map>`

.. _location-list-custom-maps:

… and location lists::

    call keymaps#mnemonic_map('location', {'local': v:true})

.. seealso::

    * :func:`keymaps#mnemonic_map() <mnemonic_map>`

Find occurrences of current word::

    nnoremap <silent> [quickfix]sw :vimgrep <C-r>=expand('<cword>')<CR> %<CR>
    nnoremap <silent> [quickfix]sW :grep <C-r>=expand('<cword>')<CR><CR>
    nnoremap <silent> [location]sw :lvimgrep <C-r>=expand('<cword>')<CR> %<CR>
    nnoremap <silent> [location]sW :lgrep <C-r>=expand('<cword>')<CR><CR>

.. note::

    This functionality is provided in part with :kbd:`[I` or more closely via
    :repo:`vim-qlist <romainl/vim-qlist>`, but I like the specific buffer only
    usage and the reflection of my other ``quickfix`` maps.

… and last search::

    nnoremap <silent> [quickfix]ss :vimgrep /<C-r>=getreg('/')<CR>/g %<CR>
    nnoremap <silent> [quickfix]sS :grep /<C-r>=getreg('/')<CR>/g<CR>
    nnoremap <silent> [location]ss :lvimgrep /<C-r>getreg('/')<CR>/g %<CR>
    nnoremap <silent> [location]sS :lgrep /<C-r>=getreg('/')<CR>/g<CR>

Configure layered maps for useful quickfix and location functions::

    for s:t in ['l', 'c']
        for [s:key, s:cmd] in [
        \   ['c',          'close'],
        "\ 5 lines seems to be the magic number for *me*
        \   ['o',          'open 5<CR><C-w>p\'],
        \   ['b',          'bottom'],
        \   ['n',          'next'],
        \   ['p',          'previous'],
        \   ['<PageDown>', 'newer'],
        \   ['<PageUp>',   'older'],
        \   ['r',          'rewind'],
        \   ['l',          'last'],
        \   ['<Down>',     'next'],
        \   ['<Up>',       'previous'],
        \ ]
            call keymaps#quickfix_key(s:t, s:key, s:cmd)
        endfor
    endfor
    execute 'nnoremap <silent> [quickfix]x
    \   :call setqflist([], "r",
    \                   {"items": [],
    \                    "title": getqflist({"title": v:true}).title})<CR>'
    execute 'nnoremap <silent> [location]x
    \   :call setloclist(0, [], "r",
    \                    {"items": [],
    \                     "title": getloclist(0, {"title": v:true}).title})<CR>'
    execute 'nnoremap <silent> [quickfix]X
    \   :call setqflist([], "f", {"title": ""})<CR>'
    execute 'nnoremap <silent> [location]X
    \   :call setloclist(0, [], "f", {"title": ""})<CR>'

.. seealso::

    * :func:`keymaps#quickfix_key() <quickfix_key>`

Shortcut command to rename current list:::

    command! -bar -nargs=1 QFRename
    \   call setqflist([], 'a', {'title': <q-args>}) | redrawstatus!
    command! -bar -nargs=1 LocRename
    \   call setloclist(0, [], 'a', {'title': <q-args>}) | redrawstatus!

.. note::

    The prefixes were chosen to match :ref:`vim-editqf <vim-editqf-plugin>`’s
    naming.
