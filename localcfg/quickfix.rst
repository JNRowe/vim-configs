``localcfg/quickfix.vim``
=========================

.. include:: ../.includes/scriptencoding.rst

.. _quickfix-custom-maps:

Configure my custom maps::

    call misc#mnemonicmap('quickfix', {'key': 'f', 'local': v:true})

.. _location-list-custom-maps:

::

    call misc#mnemonicmap('location', {'local': v:true})

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

Display occurrences of current word::

    nnoremap <silent> [quickfix]sw :vimgrep <C-r>=expand('<cword>')<CR> %<CR>
    nnoremap <silent> [quickfix]sW :grep <C-r>=expand('<cword>')<CR><CR>
    nnoremap <silent> [location]sw :lvimgrep <C-r>=expand('<cword>')<CR> %<CR>
    nnoremap <silent> [location]sW :lgrep <C-r>=expand('<cword>')<CR><CR>

… and last search::

    nnoremap <silent> [quickfix]ss :vimgrep /<C-r>=getreg('/')<CR>/g %<CR>
    nnoremap <silent> [quickfix]sS :grep /<C-r>=getreg('/')<CR>/g<CR>
    nnoremap <silent> [location]ss :lvimgrep /<C-r>getreg('/')<CR>/g %<CR>
    nnoremap <silent> [location]sS :lgrep /<C-r>=getreg('/')<CR>/g<CR>

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
    execute 'nnoremap <silent> [quickfix]x
        \ :call setqflist([], "r", {"items": [], "title": getqflist({"title": v:true}).title})<CR>'
    execute 'nnoremap <silent> [location]x
        \ :call setloclist(0, [], "r", {"items": [], "title": getloclist(0, {"title": v:true}).title})<CR>'
    execute 'nnoremap <silent> [quickfix]X
        \ :call setqflist([], "f", {"title": ""})<CR>'
    execute 'nnoremap <silent> [location]X
        \ :call setloclist(0, [], "f", {"title": ""})<CR>'

Shortcut command to rename current list:::

    command! -bar -nargs=1 QFRename
        \ call setqflist([], 'a', {'title': <q-args>}) | redrawstatus!
    command! -bar -nargs=1 LocRename
        \ call setloclist(0, [], 'a', {'title': <q-args>}) | redrawstatus!

.. note::

    The prefixes were chosen to match :ref:`vim-editqf <vim-editqf-plugin>`’s
    naming.
