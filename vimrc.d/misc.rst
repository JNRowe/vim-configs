``vimrc.d/misc.vim``
====================

Show highlight group of the :ref:`current location
<GetHighlightGroup-function>`::

    command! ShowHighlightGroups
        \ echo join(map(misc#GetHighlightGroup(),
        \               {k, v -> join(values(map(v,
        \                                        {k, v -> k . ':' . v})),
        \                             ', ')}),
        \           ' | ')


User email address, as used by various plugins::

    silent let g:user_email = systemlist('git -C ~ config user.name')[0] .
        \ ' <' . systemlist('git -C ~ config user.email')[0] . '>'

Many distributions package :command:`vim` with cherry picked patches, and
sometimes it is nice to know the current base version state::

    function! Version() abort
        let l:n = 1
        while has('patch' . n)
            let l:n += 1
        endwhile
        return printf('%d.%d.%04d', v:version / 100, v:version % 100, n - 1)
    endfunction
    command! Version echo 'vim-' . Version()

Make it easy to :command:`diff` options between sessions, which can be nice for
debugging, by printing the entirety of options::

    function! s:insert_options() abort
        python3 << EOF
    for k in sorted(vim.options):
        vim.current.buffer.append(f'{k}={vim.options[k]!r}')
    EOF
    endfunction
    command! InsertOptions call <SID>insert_options()

.. note::

    This is different to ``:mkexrc`` in that it displays *all* options, not
    just the ones you have changed.  This is far nicer behaviour when you’ve
    upgraded and want to see what has changed.  It is also different to using
    ``:set`` with ``:redir`` as the output is easier to diff.

Add on-hover word definitions, which can be useful for prose editing::

    if has('gui_running') && executable('wn')
        command WordNetBalloon
            \ setlocal balloonexpr=misc#CommandBalloon('wn\ %s\ -over')
    endif

.. note::

    This is only enabled for :command:`gvim` as I have the mouse configured in
    a way which would be problematic for use with ``balloonevalterm``.
