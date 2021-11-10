``autoload/gui.vim``
====================

.. function:: set_font(font: Union[int, str])


    Change :abbr:`GUI (Graphical User Interface)` fonts.

    Using the following rules:

    * Use the default font, if only a size if given via ``v:count``
    * Switch to default font and size, if called with an empty argument

    :param font: Font to switch to

::

    function! gui#set_font(font) abort
        if !has('gui_running')
            return
        endif
        if v:count1 != 1
            let l:font = g:font_family . ' ' . v:count1
        else
            if len(a:font) == 0
                let l:font = g:font_family . ' ' . g:font_size
            else
                let l:font = substitute(a:font, '\\', '', 'g')
            endif
        endif
        execute 'set guifont=' . fnameescape(l:font)
    endfunction

.. function:: font_complete(arglead: str, cmdline: str, cursorpos: int) -> List[str]

    Completion options for :func:`set_font`.

    .. note::

        The standard completion callback arguments are unused.

::

    function! gui#font_complete(_, _2, _3) abort
        return join(
        \   [escape(g:font_family . ' ' . g:font_size, ' '), ]
        \   + map(range(8),
        \         {n -> escape(g:font_family . ' ' . (n * 8 + 16), ' ')}),
        \   "\n"
        \ )
    endfunction

.. note::

    Yeah, some of these are *huuuuuge*, but I’ll often pop up a snippet for
    discussion in a meeting and this really helps.
