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

    let s:feature_terms = '^\(linux\|\(rxvt-unicode\|st\|xterm\)\(-256color\)\?\)$'
    if &term =~# s:feature_terms || split($COLORFGBG . ';padding', ';')[0] == 15
        set background=dark
    else
        set background=light
    endif

… and change the cursor colour for insert mode on supported terminals::

    if &term =~# s:feature_terms && exists('&t_SI')
        let &t_SI = "\<Esc>]12;purple\x7"
        let &t_EI = "\<Esc>]12;green\x7"
    endif

.. todo::

    This is brittle, but I don’t know a foolproof way to handle it.  Thoughts?

Omnicompletion rocks, but :kbd:`<C-x><C-o>` doesn’t::

    inoremap <Nul> <C-x><C-o>
