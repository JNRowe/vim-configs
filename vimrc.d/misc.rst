``vimrc.d/misc.vim``
====================

Show highlight group of the current location::

    command! ShowHighlightGroups
    \   echo join(map(display#get_highlight_group(),
    \                 {k, v -> join(values(map(v,
    \                                          {k, v -> k . ':' . v})),
    \                               ', ')}),
    \             ' | ')

.. seealso::

    * :func:`display#get_highlight_group() <get_highlight_group>`

.. _default-user-identifier:

User email address, as used by various plugins::

    silent let g:user_email = systemlist('git -C ~ config user.name')[0] .
    \   ' <' . systemlist('git -C ~ config user.email')[0] . '>'

Display base :command:`vim` version::

    command! Version echo 'vim-' . misc#version()

Make it easy to :command:`diff` options between sessions, which can be nice for
debugging, by printing the entirety of options::

    command! InsertOptions call misc#insert_options()

.. seealso::

    * :func:`misc#insert_options() <insert_options>`

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
    a way which would be problematic for use with ``'balloonevalterm'``.

Search for paths with easy access to completion at the prompt::

    command PathSearch call misc#path_search()

.. seealso::

    * :func:`misc#path_search() <path_search>`

Insert a modeline on the last line::

    command! -bang Modeline call misc#modeline_stub(<bang>0)

.. seealso::

    * :func:`misc#modeline_stub() <modeline_stub>`

.. tip::

    When executed with :kbd:`!` write a fuller and more verbose modeline.

Pretty print an option’s value to make it easier to read::

    command! -complete=option -nargs=1 PrintOption
    \   call misc#print_option(<q-args>)

.. seealso::

    * :func:`misc#print_option() <print_option>`

Convenience command to build a given target with full completion::

    command! -nargs=* -complete=customlist,completion#build_complete Make
    \   :call misc#call_build(<q-args>)<CR>

.. seealso::

    * :func:`misc#call_build() <call_build>`

This places perforation-style lines around the given range::

    command! -range Snip <line1>,<line2>call misc#scissors()

.. seealso::

    * :func:`misc#scissors() <scissors>`
