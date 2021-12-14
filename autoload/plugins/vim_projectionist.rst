``autoload/plugins/vim_projectionist.vim``
==========================================

.. function:: apply_commands() -> None

    Apply inline commands from projectionist templates.

    This allows you to include an executable command within a template by ending
    a line with the string ``]|[`` and followed by a normal mode command.  For
    example, ``]|[yyp`` would duplicate the current line.

::

    function plugins#vim_projectionist#apply_commands() abort
        let l:curpos = getcurpos()
        while search('\]|\[')
            let [l:line, l:command] = split(getline('.'), ']|[')
            call setline('.', l:line)
            execute 'normal ' . l:command
        endwhile
        call setpos('.', l:curpos)
    endfunction
