``localcfg/plugin_vim_peekaboo.vim``
====================================

When I know the register I’m aiming for I’ll hit it quick enough to still see an
annoying flash, so skip the display for short delays::

    let g:peekaboo_delay = 250

The full register listing — with its extra whitespace — *feels* cleaner to me,
so let’s use it if we can::

    if has('gui_running')
        if executable('xdotool')
            silent let s:win_height =
            \   system('xdotool getwindowgeometry --shell ' . v:windowid)
            let s:win_height = str2nr(substitute(s:win_height,
            \                                    '.*HEIGHT=\([0-9]\+\).*',
            \                                    '\1', ''))
            let g:peekaboo_compact = s:win_height < 800
        else
            let g:peekaboo_compact = v:false
        endif
    else
        let g:peekaboo_compact = expand('$LINES') < 30
    endif

.. note::

    The window size tests aren’t bulletproof, but appear to function reasonably
    well.
