``localcfg/gui_running.vim``
============================

.. code-block:: vim

    set guiheadroom=0

.. code-block:: vim

    set guioptions+=chR
    set guioptions-=L
    set guioptions-=R
    set guioptions-=T
    set guioptions-=m
    set guioptions-=r

.. code-block:: vim

    set mousemodel=popup_setpos

Always display line number in the GUI

.. code-block:: vim

    set number
    set relativenumber

Shift insert works the same as in a terminal

.. code-block:: vim

    noremap <S-Insert> <MiddleMouse>
    noremap! <S-Insert> <MiddleMouse>

.. code-block:: vim

    let s:font_family='Consolas'
    let &guifont=s:font_family . ' 13'

.. code-block:: vim

    if has('title')  && has('clientserver')
        set titlestring+=%{v:servername!='GVIM'?'\ ['.v:servername.']':''}
    endif

Omnicompletion rocks, but <C-x><C-o> doesn't.

.. code-block:: vim

    inoremap <C-Space> <C-x><C-o>

.. code-block:: vim

    if has('menu')
        nnoremap <silent> <S-F4> :call ToggleFlag('guioptions', 'm')<CR>
    endif
    if has('toolbar')
        nnoremap <silent> <C-F4> :call ToggleFlag('guioptions', 'T')<CR>
    endif

Yeah, some of these are *huuuuuge* but I often pop up a snippet in a meeting
and this helps.

.. code-block:: vim

    function! s:font_complete(arglead, cmdline, cursorpos)
        return [s:font_family . '\ 13', ]
            \ + map(range(8), "s:font_family . '\\ ' . (v:val * 8 + 16)")
    endfunction
    command! -nargs=1 -complete=customlist,s:font_complete Fontsel set guifont=<args>
