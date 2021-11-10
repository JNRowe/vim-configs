``autoload/keymaps.vim``
========================

Ping the cursor position::

    function! keymaps#cursor_ping() abort
        let [l:cursorline, l:cursorcolumn] = [&cursorline, &cursorcolumn]
        for _ in range(5)
            set cursorline! cursorcolumn!
            redraw
            sleep 15m
        endfor
        let [&cursorline, &cursorcolumn] = [l:cursorline, l:cursorcolumn]
    endfunction

.. _mnemonic-map:

Mnemonic mapping setup function::

    function! keymaps#mnemonic_map(name, ...) abort
        let l:extra = get(a:, 1, {})
        let l:buffer = get(l:extra, 'buffer', v:false) ? '<buffer>' : ''
        let l:key = get(l:extra, 'key', tolower(a:name[0]))
        let l:leader = get(l:extra, 'local', v:false) ? 'Local' : ''
        let l:mode = get(l:extra, 'mode', 'n')
        execute l:mode . 'noremap ' . l:buffer . ' [' . a:name . '] <Nop>'
        execute l:mode . 'map ' . l:buffer . ' <' . l:leader . 'Leader>'
            \ . l:key . ' [' . a:name . ']'
        execute l:mode . 'noremap <silent> [' . a:name . ']?'
            \ ' :' . l:mode . 'map [' . a:name . ']<CR>'
    endfunction

.. tip::

    This adds a :kbd:`?` binding to display the map list for ``name``.

Relative buffer switching while ignoring scratch buffers::

    function! keymaps#switch_buf(count) abort
        let l:bufs = filter(
            \   range(1, bufnr('$')),
            \   {_, n -> buflisted(n) && !empty(bufname(n))}
            \ )
        if len(l:bufs) < 2
            return
        endif
        let l:current = index(l:bufs, bufnr('%'))
        if abs(a:count) > 1
            let l:default = a:count < 1 ? l:bufs[0] : bufnr('$')
        else
            let l:default = bufnr('%') == 1 ? bufnr('$') : l:bufs[0]
        endif
        let l:buf = get(l:bufs, l:current + a:count, l:default)
        execute 'buffer ' . l:buf
    endfunction