``localcfg/notgui_running.vim``
===============================

Set up the menus so ``:emenu`` works properly::

    runtime! ALL menu.vim

Use system’s terminal capabilities database, as I’m in the unusual situation
where :command:`vim`’s are inferior on many of the systems I regularly use::

    set nottybuiltin

Annoying, but necessary, to refresh termcap::

    set term=$TERM

If possible enable 24-bit colour::

    if has('termguicolors') && &t_Co > 256
        set termguicolors
    endif

Poke around, as best we can, to discern the background colour::

    let s:feature_terms =
    \   '^\(kitty\|linux\|\(rxvt-unicode\|st\|xterm\)\(-256color\)\?\)$'
    if &term =~# s:feature_terms || split($COLORFGBG . ';padding', ';')[0] == 15
        if &background !=# 'dark'
            set background=dark
        endif
    else
        if &background !=# 'light'
            set background=light
        endif
    endif

.. note::

    We purposely check that we’re changing the background setting, as it can
    cause an ugly redraw or reissue ``autocmd``\s.

… and change the cursor colour depending on mode on supported terminals::

    if &term =~# s:feature_terms && exists('&t_SI')
        let &t_EI = "\<Esc>]12;green\x7"
        let &t_SI = "\<Esc>]12;purple\x7"
        let &t_SR = "\<Esc>]12;red\x7"

.. todo::

    This is brittle, but I don’t know a foolproof way to handle it.  Thoughts?

… and match cursor types to :command:`gvim`::

        let &t_EI .= "\<Esc>[2 q"
        let &t_SI .= "\<Esc>[6 q"
        let &t_SR .= "\<Esc>[4 q"
    endif

Omnicompletion rocks, but :kbd:`<C-x><C-o>` doesn’t::

    if has('insert_expand')
        inoremap <Nul> <C-x><C-o>
    endif

kitty_ and :command:`vim` `interact poorly`_ with background repainting, the
following works around it::

    if $TERM ==# 'xterm-kitty'
        let &t_ut=''
    endif

kitty_ has some really cool features, called kittens_, that can do all kinds of
magic; ``icat``, for example, can display images inline.  However,
:command:`vim` works in the alternate screen where the images will not be
displayed.  The following snippet disables the alternate screen, which is a poor
solution to workaround this::

    if $TERM ==# 'xterm-kitty'
        set t_ti= t_te=
    endif

kitty_ can display undercurls for fancier spelling error highlighting that
closely matches my setup in :command:`gvim`::

    if $TERM ==# 'xterm-kitty'
        let &t_Cs = "\e[4:3m"
        let &t_Ce = "\e[4:0m"
        highlight clear SpellBad
        highlight SpellBad ctermfg=1 term=undercurl cterm=undercurl
        augroup jnrowe_kitty
            autocmd!
            autocmd ColorScheme * highlight clear SpellBad |
            \   highlight SpellBad ctermfg=1 term=undercurl cterm=undercurl
        augroup END
    endif

.. _kitty: https://sw.kovidgoyal.net/kitty/
.. _interact poorly:
    https://sw.kovidgoyal.net/kitty/faq.html#using-a-color-theme-with-a-background-color-does-not-work-well-in-vim
.. _kittens: https://sw.kovidgoyal.net/kitty/#kittens
