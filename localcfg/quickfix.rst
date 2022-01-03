``localcfg/quickfix.vim``
=========================

.. include:: ../.includes/scriptencoding.rst

.. include:: ../.includes/scriptversion.rst

.. _quickfix-custom-maps:

Configure my custom maps for quickfix::

    call keymaps#mnemonic_map('quickfix', #{key: 'f', local: v:true})

.. seealso::

    * :func:`keymaps#mnemonic_map() <mnemonic_map>`

.. _location-list-custom-maps:

… and location lists::

    call keymaps#mnemonic_map('location', #{local: v:true})

.. seealso::

    * :func:`keymaps#mnemonic_map() <mnemonic_map>`

Find occurrences of current word, last search or lines that are too long::

    for [s:key, s:pat] in [
    \   ['w', '<C-r>=expand("<cword>")<CR>'],
    \   ['s', '<C-r>=getreg("/")<CR>'],
    \   ['l', '^.\{<C-r>=&tw<CR>}.\+$'],
    \ ]
        for s:type in ['q', 'l']
            for s:where in ['', '%']
                let s:prefix = s:type ==# 'l' ? 'l' : ''
                let s:cmd = s:where ==# '' ? 'grep' : 'vimgrep'
                call keymaps#quickfix_key(
                \   s:type,
                \   's' .. (s:where ==# '' ? toupper(s:key) : s:key),
                \   printf(':%s%s /%s/g %s', s:prefix, s:cmd, s:pat, s:where))
            endfor
        endfor
    endfor

.. seealso::

    * :func:`keymaps#quickfix_key() <quickfix_key>`

.. tip::

    Lowercase keys are file local, and uppercase are global.  For example,
    :kbd:`\lsW` updates the **l**\ocation list with **s**\earch results for the
    current **w**\ord.  The lowercase variant, :kbd:`\lsw`, performs the same
    action for the current buffer only.

.. note::

    The current word functionality is already provided in part with :kbd:`[I` or
    more closely via :repo:`vim-qlist <romainl/vim-qlist>`, but I like the
    buffer-only usage and the reflection of my other ``quickfix`` maps.

Configure layered maps for useful quickfix and location functions::

    for s:t in ['l', 'c']
        for [s:key, s:cmd] in [
        \   ['c',          'close'],
        "\ 5 lines seems to be the magic number for *me*
        \   ['o',          'open 5<CR><C-w>p\'],
        \   ['O',          'open 5'],
        \   ['b',          'bottom'],
        \   ['n',          'next'],
        \   ['p',          'previous'],
        \   ['r',          'rewind'],
        \   ['l',          'last'],
        \   ['<Down>',     'after'],
        \   ['<End>',      'bottom'],
        \   ['<PageDown>', 'newer'],
        \   ['<PageUp>',   'older'],
        \   ['<S-Down>',   'next'],
        \   ['<S-Up>',     'previous'],
        \   ['<Up>',       'before'],
        \ ]
            call keymaps#quickfix_key(s:t, s:key, s:cmd)
        endfor
    endfor

.. seealso::

    * :func:`keymaps#quickfix_key() <quickfix_key>`

Configure shortcuts to clear quickfix lists optionally retaining their title for
further use::

    for s:t in ['qf', 'loc']
        call keymaps#quickfix_key(
        \   s:t[0], 'x',
        \   printf(':call set%slist(%s[], "r", ' ..
        \          '#{items: [], title: misc#get_qf_title("%s")})',
        \          s:t, (s:t ==# 'loc' ? '0, ' : ''), s:t))
        call keymaps#quickfix_key(
        \   s:t[0], 'X',
        \   printf(':call set%slist(%s[], "f", #{title: ""})',
        \          s:t, (s:t ==# 'loc' ? '0, ' : '')))
    endfor

.. seealso::

    * :func:`keymaps#quickfix_key() <quickfix_key>`

Shortcut command to rename current list:::

    command! -bar -nargs=1 QFRename
    \   call setqflist([], 'a', #{title: <q-args>}) | redrawstatus!
    command! -bar -count -nargs=1 LocRename
    \   call setloclist(v:count, [], 'a', #{title: <q-args>}) | redrawstatus!

.. note::

    The prefixes were chosen to match :ref:`vim-editqf <vim-editqf-plugin>`’s
    naming.

.. spelling::

    earch
    ocation
    ord
