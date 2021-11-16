``autoload/plugins/vim_sneak.vim``
==================================

.. function:: sneak_enter() -> None

    Disable cursor highlighting.

::

    function! plugins#vim_sneak#sneak_enter() abort
        let b:sneak_cursorcolumn = &cursorcolumn
        let b:sneak_cursorline = &cursorline
        set nocursorcolumn nocursorline
    endfunction

.. function:: sneak_leave() -> None

    Reset cursor highlighting to previous state.

::

    function! plugins#vim_sneak#sneak_leave() abort
        let &cursorcolumn = b:sneak_cursorcolumn
        let &cursorline = b:sneak_cursorline
        unlet b:sneak_cursorcolumn b:sneak_cursorline
    endfunction
