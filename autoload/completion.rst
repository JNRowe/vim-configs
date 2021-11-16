``autoload/completion.vim``
===========================

.. function:: build_completion(arglead: str, cmdline: str, cursorpos: int) -> List[str]

    Completion targets from active project.

    This assumes that you are in the base directory for a project, and supports
    both ninja_ and make_.

    :param arglead: Text of argument being completed
    :param cmdline: Text of the command line
    :param cursorpos: Location within command line
    :returns: Completion candidates

::

    function! completion#build_completion(arglead, cmdline, cursorpos)
        if filereadable('build.ninja')
            let l:targets = systemlist(
            \   'sed -n "s,^build \([^:]\+\): .*,\1,p" build.ninja'
            \ )
        else
            let l:targets = systemlist(
            \   'make -pqrR | ' .
            \   'sed -n "/^# Files/,$ { s,^\([^#\.].*\): .*,\1,p }"'
            \ )
        endif
        return sort(filter(l:targets, {_, s -> s =~? '^' . a:arglead}))
    endfunction

.. _ninja: https://ninja-build.org/
.. _make: https://www.gnu.org/software/make/make.html
