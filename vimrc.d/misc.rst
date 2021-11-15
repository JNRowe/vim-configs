``vimrc.d/misc.vim``
====================

Show highlight group of the :func:`current location <gethighlightgroup>`::

    command! ShowHighlightGroups
    \   echo join(map(display#gethighlightgroup(),
    \                 {k, v -> join(values(map(v,
    \                                          {k, v -> k . ':' . v})),
    \                               ', ')}),
    \             ' | ')


.. _default-user-identifier:

User email address, as used by various plugins::

    silent let g:user_email = systemlist('git -C ~ config user.name')[0] .
    \   ' <' . systemlist('git -C ~ config user.email')[0] . '>'

Display :func:`base version <version>`::

    command! Version echo 'vim-' . misc#version()

Make it easy to :command:`diff` options between sessions, which can be nice for
debugging, by :func:`printing the entirety of options <insert_options>`::

    command! InsertOptions call misc#insert_options()

.. note::

    This is different to ``:mkexrc`` in that it displays *all* options, not just
    the ones you have changed.  This is far nicer behaviour when you’ve upgraded
    :command:`vim` and want to see what has changed.  It is also different to
    using ``:set`` with ``:redir`` as the output is easier to read in
    :command:`diff`’s output.

Add on-hover word definitions, which can be useful for prose editing::

    if has('gui_running') && executable('wn')
        command WordNetBalloon
        \   setlocal balloonexpr=display#command_balloon('wn\ %s\ -over')
    endif

.. note::

    This is only enabled for :command:`gvim` as I have the mouse configured in
    a way which would be problematic for use with ``balloonevalterm``.

:func:`Search for paths <path_search>` with easy access to completion at the
prompt::

    command PathSearch call misc#path_search()

:func:`Insert a modeline <modeline_stub>` on the last line::

    command! -bang Modeline call misc#modeline_stub(<bang>0)

.. tip::

    When executed with ``!`` write a fuller and more verbose modeline.

Pretty print an option’s value to make it easier to read::

    command! -complete=option -nargs=1 PrintOption
    \   call misc#print_option(<q-args>)
