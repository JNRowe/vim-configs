``localcfg/plugin_vim_signature.vim``
=====================================

::

    if !has('signs')
        finish
    endif

This replaces my custom info/warn/error sign code with [1-3] markers, basically
just a convenience because I'm really used to the icons.  See
``c150ea3da3effcdc4043f55aac6129b0df99d77f`` for the original idea, although it
has changed massively before we made it here.

.. tip::

    Names are from US :kbd:`<S-|digit|>` keymap(I know I’ll forget this by the
    next time *I* open this file).

::

    for [s:k, s:v] in items({'!': ['info', 'Todo'], '@': 'warning', '#': 'error'})
        if type(s:v) == v:t_list
            let s:icon = s:v[0]
            let s:hl = s:v[1]
        else
            let s:icon = s:v
            let s:hl = toupper(s:v[0]) . s:v[1:] . 'MSG'
        endif
        unlet s:v
        execute 'sign define ' .
            \ 'Signature_' . s:k . '_SignatureMarkerText_SignatureMarkerLine' .
            \ ' icon=' . expand('~/.vim/icons/' . s:icon . '.png') .
            \ ' text=' . toupper(s:icon[0] . s:icon[0]) . ' texthl=' . s:hl
    endfor

.. note::

    This is brittle *and* dirty, but there isn't much way around it.  See
    ``47ceaf9cbd970450953bdf3e84e281473a579ac0``
