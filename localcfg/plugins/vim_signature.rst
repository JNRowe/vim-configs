``localcfg/plugins/vim_signature.vim``
======================================

.. include:: ../../.includes/scriptversion.rst

This replaces my custom info/warn/error sign code with [1-3] markers, which is
basically just a convenience because I'm really used to the icons.  See :repo:`this
commit <JNRowe/vim-configs/commit/c150ea3da3effcdc4043f55aac6129b0df99d77f>` for
the original idea, although it has changed massively before we made it here.

.. note::

    Key values are from a US :kbd:`<S-[digit]>`, and do not change when using
    other layouts [#]_.

.. image:: /.static/vim_signature_icons.png
   :alt: Screenshot of sign icons

::

    for [s:k, s:v] in items({'!': ['info', 'Todo'], '@': 'warning',
    \                        '#': 'error'})
        if type(s:v) is v:t_list
            let [s:icon, s:hl] = [s:v[0], s:v[1]]
        else
            let s:icon = s:v
            let s:hl = misc#title_word(s:v) .. 'MSG'
        endif
        unlet s:v
        execute printf(
        \   'sign define ' ..
        \   'Signature_%s_SignatureMarkerText_SignatureMarkerLine ' ..
        \   'icon=%s%s.png text=%s texthl=%s',
        \   s:k, expand('~/.vim/icons/'), s:icon,
        \   toupper(s:icon[0] .. s:icon[0]), s:hl)
    endfor

.. seealso::

    * :func:`misc#title_word() <title_word>`

.. todo::

    This could use fancy colourful emojis both as a replacement for the textual
    notes, but also for the icons.  For example:

    =======  ==============
    Current  Replacement
    =======  ==============
    ``II``   💡 ``U+1F4A1``
    ``WW``   ⚠ ``U+26A0``
    ``EE``   ⛔ ``U+26D4``
    =======  ==============

    There is the not-so-minor-issue of dealing with old terminals that can’t
    display emoji, or display them poorly when their cells are non-uniform in
    size.

.. rubric:: Footnotes

.. [#] I know *I’ll* forget the origin of the keys by the next time *I* open
       this file.
