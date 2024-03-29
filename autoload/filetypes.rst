``autoload/filetypes.vim``
==========================

.. include:: ../.includes/scriptversion.rst

.. function:: add_advice_header(prio: str, due: str) -> None

    Insert a `X-Advice header`_ above the first non-black line.

    :param prio: Priority value
    :param due: Timeframe value

::

    function! filetypes#add_advice_header(prio, due) abort
        let l:view = winsaveview()
        call cursor(1, 1)
        const l:body_sep = search('^$', 'c')
        if l:body_sep != 0
            call append(l:body_sep - 1,
            \           printf('X-advice: %s read %s', a:prio,a:due))
            if l:view.lnum + 1 >= l:body_sep
                let l:view.lnum += 1
            endif
        endif
        call winrestview(l:view)
    endfunction

.. warning::

    This only works when your buffer contains headers, such as when neomutt_’s
    ``edit_headers`` option is set.  If your buffer doesn’t contain headers,
    then this will simply insert a body line in to your email.

.. function:: add_git_trailer(key: str, value: Optional[str]) -> None

    Insert a |git| trailer.

    :param key: Trailer to define
    :param value: Value to assign to trailer

::

    function! filetypes#add_git_trailer(key, ...) abort
        let l:value = get(a:, 1)
        if l:value == v:none
            call inputsave()
            let l:value = input(a:key .. '-by? ')
            call inputrestore()
        endif
        if l:value ==# ''
            return
        endif
        call misc#preserve_layout(
        \   printf(':%%!git interpret-trailers --trailer %s-by=%s',
        \          a:key, shellescape(l:value)))
    endfunction

.. function:: apply_ftplugin(options: Union[List[str], str]) -> None

    Set ``ftplugin`` options and configure resets.

    :param options: Option names to change and reset

::

    function! filetypes#apply_ftplugin(options) abort
        if type(a:options) == type('')
            const l:reset = split(a:options, '[\^\-+]\?=')[0] .. '<'
            const l:set = escape(a:options, ' "')
        else
            const l:reset = mapnew(
            \   a:options,
            \   {_, v -> split(v, '[\^\-+]\?=')[0] .. '<'}
            \ )
            const l:set = map(a:options, {_, v -> escape(v, ' ')})->join(' "')
        endif
        execute 'setlocal ' .. l:set
        if exists('b:undo_ftplugin')
            execute printf('let b:undo_ftplugin ..= "| setlocal %s"', l:reset)
        else
            execute printf('let b:undo_ftplugin = "setlocal %s"', l:reset)
        endif
    endfunction

.. function:: diff_maps() -> None

    Configure ``+diff`` specific keymaps.

::

    function! filetypes#diff_maps() abort
        call keymaps#mnemonic_map('diff', #{key: 'i', local: v:true})

        for [s:key, s:cmd] in [
        \   ['w', 'call misc#toggle_flag("diffopt", "iwhite")'],
        \   ['o', 'diffoff!'],
        \   ['p', 'diffput'],
        \   ['g', 'diffget'],
        \   ['u', 'diffupdate'],
        \ ]
            execute printf('nnoremap <buffer> [diff]%s <Cmd>%s<CR>',
            \              s:key, s:cmd)
        endfor

        vnoremap <buffer> < <Cmd>diffget<CR>
        vnoremap <buffer> > <Cmd>diffput<CR>
    endfunction

.. seealso::

    * :func:`misc#toggle_flag <toggle_flag>`

.. function:: kill_to_signature() -> None

    Kill from current line to mail signature.

::

    function! filetypes#kill_to_signature() abort
        const l:sig = search('^-- $', 'nW')
        if l:sig != 0
            execute printf('%d,%dd "_', line('.'), (l:sig - 1))
        else
            let v:warningmsg = 'Signature not found!'
            echohl WarningMsg
            echomsg v:warningmsg
            echohl none
        endif
    endfunction

.. function:: make_reST_header(level: int, pad: bool = False) -> None

    Make current line a reST heading.

    :param level: Heading level to create
    :param pad: Append blank lines to content

::

    const s:reST_header_adornments = ['=', '-', "'"]
    function! filetypes#make_reST_header(level, pad = v:false) abort
        let l:lines = [repeat(s:reST_header_adornments[a:level - 1],
        \                    strlen(getline('.'))), ]
        if a:pad is v:true
            let l:lines += ['','']
        endif
        call append(line('.'), l:lines)
        if a:pad is v:true
            let l:curpos = getcurpos()
            let l:curpos[1] += 3
            call setpos('.', l:curpos)
        endif
    endfunction

.. _X-Advice header: http://www.nicemice.net/amc/advice-header/
.. _neomutt: http://www.neomutt.org/

.. spelling::

    reST
    Timeframe
    keymaps
