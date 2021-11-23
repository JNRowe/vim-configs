``autoload/plugins/vim_peekaboo.vim``
=====================================

.. function:: set_compact() -> None

    Configure layout based on window size.

    The full register listing — with its extra whitespace — *feels* cleaner
    to me, so let’s use it if we can.

    .. note::

        This is configured so far beyond the normal way because the
        ``system()`` calls and processing take a non-negligible amount of
        time to run, and it affects time-to-first-window enough to be
        worth the effort.

::

    function plugins#vim_peekaboo#set_compact() abort
        if exists('$DISPLAY') && executable('xdotool')
            silent let s:win_geometry =
            \   system('xdotool getwindowgeometry --shell ' .
            \          (v:windowid != 0 ? v:windowid : $WINDOWID))
            let s:win_height = str2nr(substitute(s:win_geometry,
            \                                    '.*HEIGHT=\([0-9]\+\).*',
            \                                    '\1', ''))
            let g:peekaboo_compact = s:win_height < 800
        else
            let g:peekaboo_compact = v:false
        endif
    endfunction

.. note::

    The window size tests aren’t bulletproof, but appear to function
    reasonably well.
