``localcfg/quickfix.vim``
=========================

.. include:: ../.includes/scriptencoding.rst

Configure my custom maps::

    call MnemonicMap('quickfix', {'key': 'f', 'local': v:true})
    call MnemonicMap('location', {'local': v:true})

A utility function to add new map commands::

    function! s:qf_key(type, key, cmd)
        let l:group = a:type == 'l' ? 'location' : 'quickfix'
        " Commands ending with backslash don't have <CR> appended
        if a:cmd[len(a:cmd)-1] == '\'
            let l:cmd = a:cmd[:len(a:cmd)-2]
        else
            let l:cmd = a:cmd . '<CR>'
        endif
        execute 'nnoremap <silent> [' . l:group . ']' . a:key . ' :' . a:type . l:cmd
    endfunction

Display occurrences of current word in quickfix window::

    nnoremap <silent> [quickfix]sw :execute "vimgrep " . expand("<cword>") . " %"<CR>

… and last search::

    nnoremap <silent> [quickfix]ss :execute "vimgrep /" . getreg("/") . "/g %"<CR>

Configure layered maps for useful quickfix and location functions::

    for s:t in ['l', 'c']
        for [s:key, s:cmd] in [
            \   ['wc', 'close'],
            "\ 7 lines seems to be the magic number for *me*
            \   ['wo', 'open 7<CR><C-w>p\'],
            \   ['b', 'bottom'],
            \   ['n', 'next'],
            \   ['p', 'previous'],
            \   ['r', 'rewind'],
            \   ['l', 'last'],
            \ ]
            call s:qf_key(s:t, s:key, s:cmd)
        endfor
    endfor

Move up and down in the quickfix list with quick shortcut::

    nnoremap <M-Down> :cnext<CR>
    nnoremap <M-Up> :cprevious<CR>
