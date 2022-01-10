``autoload/filetypes.vim``
==========================

.. include:: ../.includes/vim9script.rst

.. function:: add_advice_header(prio: str, due: str) -> None

    Insert a `X-Advice header`_ above the first non-black line.

    :param prio: Priority value
    :param due: Timeframe value

::

    def filetypes#add_advice_header(prio: string, due: string)
        var view = winsaveview()
        cursor(1, 1)
        const body_sep = search('^$', 'c')
        if body_sep != 0
            append(l:body_sep - 1,
                   printf('X-advice: %s read %s', prio, due))
            if view.lnum + 1 >= body_sep
                view.lnum += 1
            endif
        endif
        winrestview(view)
    enddef

.. warning::

    This only works when your buffer contains headers, such as when neomutt_’s
    ``edit_headers`` option is set.  If your buffer doesn’t contain headers,
    then this will simply insert a body line in to your email.

.. function:: add_git_trailer(key: str, value: Optional[str]) -> None

    Insert a |git| trailer.

    :param key: Trailer to define
    :param value: Value to assign to trailer

::

    def filetypes#add_git_trailer(key: string, value = '')
        if empty(value)
            inputsave()
            value = input(key .. '-by? ')
            inputrestore()
        endif
        if empty(value)
            return
        endif
        misc#preserve_layout(
            printf(':%%!git interpret-trailers --trailer %s-by=%s',
                   key, shellescape(value)))
    enddef

.. function:: apply_ftplugin(options: Union[List[str], str]) -> None

    Set ``ftplugin`` options and configure resets.

    :param options: Option names to change and reset

::

    def filetypes#apply_ftplugin(options: any)
        var reset: string
        var set: string
        if type(options) == type('')
            reset = split(options, '[\^\-+]\?=')[0] .. '<'
            set = escape(options, ' "')
        else
            reset = mapnew(options,
                           (_, v) => split(v, '[\^\-+]\?=')[0] .. '<')
            set = map(options, (_, v) => escape(v, ' '))->join(' "')
        endif
        execute 'setlocal ' .. set
        if exists('b:undo_ftplugin')
            execute printf('b:undo_ftplugin ..= "| setlocal %s"', reset)
        else
            execute printf('b:undo_ftplugin = "setlocal %s"', reset)
        endif
    enddef

.. function:: diff_maps() -> None

    Configure ``+diff`` specific keymaps.

::

    def filetypes#diff_maps()
        keymaps#mnemonic_map('diff', {key: 'i', local: v:true})

        for [key, cmd] in [
            ['w', 'call misc#toggle_flag("diffopt", "iwhite")'],
            ['o', 'diffoff!'],
            ['p', 'diffput'],
            ['g', 'diffget'],
            ['u', 'diffupdate'],
        ]
            execute printf('nnoremap <buffer> [diff]%s <Cmd>%s<CR>', key, cmd)
        endfor

        vnoremap <buffer> < <Cmd>diffget<CR>
        vnoremap <buffer> > <Cmd>diffput<CR>
    enddef

.. seealso::

    * :func:`misc#toggle_flag <toggle_flag>`

.. function:: kill_to_signature() -> None

    Kill from current line to mail signature.

::

    def filetypes#kill_to_signature()
        const sig = search('^-- $', 'nW')
        if sig != 0
            execute printf('%d,%dd "_', line('.'), (sig - 1))
        else
            v:warningmsg = 'Signature not found!'
            echohl WarningMsg
            echomsg v:warningmsg
            echohl none
        endif
    enddef

.. function:: make_reST_header(level: int, pad: bool = False) -> None

    Make current line a reST heading.

    :param level: Heading level to create
    :param pad: Append blank lines to content

::

    const reST_header_adornments = ['=', '-', "'"]
    def filetypes#make_reST_header(level: number, pad = v:false)
        var lines = [repeat(s:reST_header_adornments[a:level - 1],
                     strlen(getline('.'))), ]
        if pad is v:true
            lines += ['','']
        endif
        append(line('.'), lines)
        if a:pad is v:true
            var curpos = getcurpos()
            curpos[1] += 3
            setpos('.', curpos)
        endif
    enddef

.. _X-Advice header: http://www.nicemice.net/amc/advice-header/
.. _neomutt: http://www.neomutt.org/

.. spelling::

    reST
    Timeframe
    keymaps
