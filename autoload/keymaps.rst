``autoload/keymaps.vim``
========================

.. include:: ../.includes/vim9script.rst

.. include:: ../.includes/scriptencoding.rst

.. function:: home_skip() -> None

    Jump between first character and first non-blank character on line.

::

    def keymaps#home_skip()
        if col('.') != 1
            normal! 0
        else
            normal! ^
        endif
    enddef

.. function:: mnemonic_map(name: str, buffer: Optional[bool] = False, key: Optional[str], local: Optional[bool] = False, modes: Optional[str] = 'n') -> None

    Mnemonic mapping setup function.

    :param name: Name to give to map group
    :param buffer: Maps are specific to the buffer
    :param key: Key to use for map, defaults to first character of ``name``
    :param local: If truthy, use ``<LocalLeader>`` for map
    :param modes: Modes to apply map group to

::

    def keymaps#mnemonic_map(name: string, extra = {})
        const buffer = get(extra, 'buffer', v:false) ? '<buffer>' : ''
        const key = get(extra, 'key', tolower(name[0]))
        const local = get(extra, 'local', v:false) ? 'Local' : ''
        const modes = get(extra, 'modes', 'n')
        for mode in misc#str2chars(modes)
            execute printf('%snoremap %s [%s] <Nop>', mode, buffer, name)
            execute printf('%smap %s <%sLeader>%s [%s]', mode, buffer, local,
                           key, name)
        endfor
        execute printf('noremap [%s]? <Cmd>filter /\[%s\]/ map<CR>', name,
                       name)
    enddef

.. tip::

    This adds a :kbd:`?` binding to display the map list for ``name``.

.. function:: quickfix_key(type: str, key: str, cmd: str) -> None

    A utility function to add new ``quickfix`` map commands.

    :param type: Which mode to add map for; ``q``\uickfix or ``l``\ocation
    :param key: Key to map
    :param cmd: Command to execute for map

::

    def keymaps#quickfix_key(type: string, key: string, cmd: string)
        const group = type ==# 'l' ? 'location' : 'quickfix'
        var cmd_: string
        # Commands ending with backslash don’t have <CR> appended
        if slice(cmd, -1) ==# '\'
            cmd_ = slice(cmd, 0, -1)
        else
            cmd_ = cmd .. '<CR>'
        endif
        # Commands beginning with : don’t have a:type prefix inserted
        if cmd_[0] !=# ':'
            cmd_ = printf(':%s%s', type, cmd_)
        endif
        execute printf('nnoremap <silent> [%s]%s %s', group, key, cmd_)
    enddef

.. function:: switch_buf(count: int) -> None

    Relative buffer switching while ignoring scratch buffers.

    :param count: Number of buffers to move through

::

    def keymaps#switch_buf(count: number)
        const bufs = range(1, bufnr('$'))->filter(
        \   (_, n) => buflisted(n) && !empty(bufname(n))
        \ )
        if len(bufs) < 2
            return
        endif
        const current = index(bufs, bufnr('%'))
        var default: number
        if abs(count) > 1
            default = count < 1 ? bufs[0] : bufnr('$')
        else
            default = bufnr('%') == 1 ? bufnr('$') : bufs[0]
        endif
        const buf = get(bufs, current + count, default)
        execute 'buffer ' .. buf
    enddef

.. spelling::

    ocation
    uickfix
