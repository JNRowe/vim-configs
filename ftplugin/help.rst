``ftplugin/help.vim``
=====================

Issue an immediate “split to right” for help buffers, with an attempt made to
skip portrait displays.

::

    if has('vertsplit')
        if !exists('g:display_portrait')
            if executable('xdotool')
                silent let s:geo = split(system('xdotool getdisplaygeometry'))
                let g:display_portrait = s:geo[0] < s:geo[1]
            else
                let g:display_portrait = v:none
            endif
        endif
        if !g:display_portrait
            wincmd L
        endif
    endif
