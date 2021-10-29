``ftplugin/help.vim``
=====================

Issue an immediate “split to right” for help buffers, with an attempt made to
skip portrait displays.

::

    if has('vertsplit')
        if !exists('g:display_portrait')
            if executable('xdotool')
                silent let [s:width, s:height] =
                    \ map(split(system('xdotool getdisplaygeometry')),
                    \     {_, s -> str2nr(s)})
                let g:display_portrait = s:width < s:height
            else
                let g:display_portrait = v:none
            endif
        endif
        if g:display_portrait == v:false && winnr('$') > 1
            wincmd L
        endif
    endif
