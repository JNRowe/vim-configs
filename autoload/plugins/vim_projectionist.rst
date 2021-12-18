``autoload/plugins/vim_projectionist.vim``
==========================================

.. include:: ../../.includes/scriptencoding.rst

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

.. function:: apply_options() -> None

    Apply |vim| options from projectionist configuration.

    This allows you to configure |vim| from within ``vim-projectionist``’s
    :file:`.projections.json`.  We take advantage of :repo:`securemodelines
    <JNRowe/securemodelines>`’s allow list to block options that *may* be
    dangerous.

::

    function plugins#vim_projectionist#apply_options() abort
        let l:data = projectionist#query('vim_options')
        for [l:_, l:options] in reverse(l:data)
            for l:s in l:options
                let l:optname = split(l:s, '[\^\-+]\?=')[0]
                if index(g:secure_modelines_allowed_items, l:optname) != -1
                    execute 'setlocal ' . l:s
                else
                    echohl WarningMsg
                    echo 'Not setting “' . l:optname . '” from projection'
                    echohl None
                endif
            endfor
        endfor
    endfunction
