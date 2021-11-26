``autoload/keymaps.vim``
========================

.. include:: ../.includes/scriptencoding.rst

.. function:: home_skip() -> None

    Jump between first character and first non-blank character on line.

::

    function! keymaps#home_skip() abort
        if col('.') != 1
            normal! 0
        else
            normal! ^
        endif
    endfunction

.. function:: mnemonic_map(name: str, buffer: Optional[bool] = False, key: Optional[str], local: Optional[bool] = False, modes: Optional[str] = 'n') -> None

    Mnemonic mapping setup function.

    :param name: Name to give to map group
    :param buffer: Maps are specific to the buffer
    :param key: Key to use for map, defaults to first character of ``name``
    :param local: If truthy, use ``<LocalLeader>`` for map
    :param modes: Modes to apply map group to

::

    function! keymaps#mnemonic_map(name, ...) abort
        let l:extra = get(a:, 1, {})
        let l:buffer = get(l:extra, 'buffer', v:false) ? '<buffer>' : ''
        let l:key = get(l:extra, 'key', tolower(a:name[0]))
        let l:local = get(l:extra, 'local', v:false) ? 'Local' : ''
        let l:modes = get(l:extra, 'modes', 'n')
        for l:mode in split(l:modes, '\zs')
            execute l:mode . 'noremap ' . l:buffer . ' [' . a:name . '] <Nop>'
            execute l:mode . 'map ' . l:buffer . ' <' . l:local . 'Leader>'
            \   . l:key . ' [' . a:name . ']'
        endfor
        execute 'noremap <silent> [' . a:name . ']? :map [' . a:name . ']<CR>'
    endfunction

.. tip::

    This adds a :kbd:`?` binding to display the map list for ``name``.

.. function:: quickfix_key(type: str, key: str, cmd: str) -> None

    A utility function to add new ``quickfix`` map commands.

    :param type: Which mode to add map for; ``q``\uickfix or ``l``\ocation
    :param key: Key to map
    :param cmd: Command to execute for map

::

    function! keymaps#quickfix_key(type, key, cmd) abort
        let l:group = a:type ==# 'l' ? 'location' : 'quickfix'
        " Commands ending with backslash don’t have <CR> appended
        if a:cmd[len(a:cmd)-1] ==# '\'
            let l:cmd = a:cmd[:len(a:cmd)-2]
        else
            let l:cmd = a:cmd . '<CR>'
        endif
        execute 'nnoremap <silent> [' . l:group . ']' . a:key . ' :' .
        \   a:type . l:cmd
    endfunction


.. function:: switch_buf(count: int) -> None

    Relative buffer switching while ignoring scratch buffers.

    :param count: Number of buffers to move through

::

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

.. spelling::

    ocation
    uickfix
