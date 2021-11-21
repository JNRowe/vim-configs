``autoload/completion.vim``
===========================

.. function:: build_complete(arglead: str, cmdline: str, cursorpos: int) -> List[str]

    Completion targets from active project.

    This assumes that you are in the base directory for a project, and supports
    both ninja_ and make_.

    :param arglead: Text of argument being completed
    :param cmdline: Text of the command line
    :param cursorpos: Location within command line
    :returns: Completion candidates

::

    function! completion#build_complete(arglead, cmdline, cursorpos)
        if filereadable('build.ninja')
            let l:targets = systemlist('ninja -t targets | cut -d: -f1')
        else
            let l:targets = systemlist(
            \   'make -pqrR | ' .
            \   'sed -n "/^# Files/,$ { s,^\([^#\.].*\): .*,\1,p }"'
            \ )
        endif
        return sort(filter(l:targets, {_, s -> s =~? '^' . a:arglead}))
    endfunction

.. function:: set_font_complete(arglead: str, cmdline: str, cursorpos: int) -> List[str]

    Completion options for :func:`set_font`.

::

    function! completion#set_font_complete(arglead, cmdline, cursorpos) abort
        let l:fonts =
        \   [escape(g:font_family . ' ' . g:font_size, ' '), ]
        \   + map(range(8),
        \         {n -> escape(g:font_family . ' ' . (n * 8 + 16), ' ')})
        return sort(
        \   filter(l:fonts,
        \          {_, s -> strpart(s, 0, len(a:arglead)) ==# a:arglead})
        \ )
    endfunction

.. note::

    Yeah, some of these are *huuuuuge*, but I’ll often pop up a snippet for
    discussion in a meeting and this really helps.

.. function:: project_file_complete(arglead: str, cmdline: str, cursorpos: int) -> List[str]

    Completion targets for project-specific configuration files.

    :param arglead: Text of argument being completed
    :param cmdline: Text of the command line
    :param cursorpos: Location within command line
    :returns: Completion candidates

::

    function! completion#project_file_complete(arglead, cmdline, cursorpos)
        return sort(filter(['abbr.vim', 'project.vim'],
        \                  {_, s -> s =~? '^' . a:arglead}))
    endfunction

.. _ninja: https://ninja-build.org/
.. _make: https://www.gnu.org/software/make/make.html
