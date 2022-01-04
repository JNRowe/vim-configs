``autoload/keymaps.vim``
========================

.. include:: ../.includes/scriptencoding.rst

.. include:: ../.includes/scriptversion.rst

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
        const l:extra = get(a:, 1, {})
        const l:buffer = get(l:extra, 'buffer', v:false) ? '<buffer>' : ''
        const l:key = get(l:extra, 'key', tolower(a:name[0]))
        const l:local = get(l:extra, 'local', v:false) ? 'Local' : ''
        const l:modes = get(l:extra, 'modes', 'n')
        for l:mode in misc#str2chars(l:modes)
            execute printf('%snoremap %s [%s] <Nop>', l:mode, l:buffer, a:name)
            execute printf('%smap %s <%sLeader>%s [%s]', l:mode, l:buffer,
            \              l:local, l:key, a:name)
        endfor
        execute printf('noremap <silent> [%s]? :filter /\[%s\]/ map<CR>',
        \              a:name, a:name)
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
        const l:group = a:type ==# 'l' ? 'location' : 'quickfix'
        " Commands ending with backslash don’t have <CR> appended
        if slice(a:cmd, -1) ==# '\'
            let l:cmd = slice(a:cmd, 0, -1)
        else
            let l:cmd = a:cmd .. '<CR>'
        endif
        " Commands beginning with : don’t have a:type prefix inserted
        if a:cmd[0] !=# ':'
            let l:cmd = printf(':%s%s', a:type, l:cmd)
        endif
        execute printf('nnoremap <silent> [%s]%s %s', l:group, a:key, l:cmd)
    endfunction

.. function:: switch_buf(count: int) -> None

    Relative buffer switching while ignoring scratch buffers.

    :param count: Number of buffers to move through

::

    function! keymaps#switch_buf(count) abort
        const l:bufs = filter(
        \   range(1, bufnr('$')),
        \   {_, n -> buflisted(n) && !empty(bufname(n))}
        \ )
        if len(l:bufs) < 2
            return
        endif
        const l:current = index(l:bufs, bufnr('%'))
        if abs(a:count) > 1
            const l:default = a:count < 1 ? l:bufs[0] : bufnr('$')
        else
            const l:default = bufnr('%') == 1 ? bufnr('$') : l:bufs[0]
        endif
        const l:buf = get(l:bufs, l:current + a:count, l:default)
        execute 'buffer ' .. l:buf
    endfunction

.. spelling::

    ocation
    uickfix
