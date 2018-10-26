``localcfg/notgui_running.vim``
===============================

Set up the menus so emenu works properly

.. code-block:: vim

    runtime! ALL menu.vim

.. code-block:: vim

    set nottybuiltin

Annoying, but necessary, to refresh termcap

.. code-block:: vim

    set term=$TERM

.. code-block:: vim

    if has('termguicolors') && &t_Co > 256
        set termguicolors
    endif

.. code-block:: vim

    if $TERM =~# '^\(linux\|\(rxvt-unicode\|st\|xterm\)\(-256color\)\?\)$' ||
        \ split($COLORFGBG . ';padding', ';')[0] == 15
        set background=dark
    else
        set background=light
    endif

Change the cursor colour for insert mode

.. code-block:: vim

    if &term =~? '^rxvt' && exists('&t_SI')
        let &t_SI = "\<Esc>]12;purple\x7"
        let &t_EI = "\<Esc>]12;green\x7"
    endif

Omnicompletion rocks, but <C-x><C-o> doesn't.

.. code-block:: vim

    inoremap <Nul> <C-x><C-o>
