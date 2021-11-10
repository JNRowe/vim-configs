``autoload/gui.vim``
====================

Change :abbr:`GUI <Graphical User Interface>` fonts, using the following rules:

* Use the default font, if only a size if given via ``v:count``
* Switch to default font and size, if called with an empty argument

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

    function! gui#font_complete(arglead, cmdline, cursorpos) abort
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
