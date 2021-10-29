``localcfg/quickfix.vim``
=========================

.. include:: ../.includes/scriptencoding.rst

.. _quickfix-custom-maps:

Configure my custom maps::

    call misc#MnemonicMap('quickfix', {'key': 'f', 'local': v:true})

.. _location-list-custom-maps:

::

    call misc#MnemonicMap('location', {'local': v:true})

A utility function to add new map commands::

    function! s:qf_key(type, key, cmd) abort
        let l:group = a:type ==# 'l' ? 'location' : 'quickfix'
        " Commands ending with backslash don’t have <CR> appended
        if a:cmd[len(a:cmd)-1] ==# '\'
            let l:cmd = a:cmd[:len(a:cmd)-2]
        else
            let l:cmd = a:cmd . '<CR>'
        endif
        execute 'nnoremap <silent> [' . l:group . ']' . a:key . ' :' . a:type . l:cmd
    endfunction

Display occurrences of current word in quickfix window::

    nnoremap <silent> [quickfix]sw :execute 'vimgrep ' . expand('<cword>') . ' %'<CR>

… and last search::

    nnoremap <silent> [quickfix]ss :execute 'vimgrep /' . getreg('/') . '/g %'<CR>

Configure layered maps for useful quickfix and location functions::

    for s:t in ['l', 'c']
        for [s:key, s:cmd] in [
            \   ['c',          'close'],
            "\ 7 lines seems to be the magic number for *me*
            \   ['o',          'open 7<CR><C-w>p\'],
            \   ['b',          'bottom'],
            \   ['n',          'next'],
            \   ['p',          'previous'],
            \   ['<PageUp>',   'newer'],
            \   ['<PageDown>', 'older'],
            \   ['r',          'rewind'],
            \   ['l',          'last'],
            \ ]
            call s:qf_key(s:t, s:key, s:cmd)
        endfor
    endfor
