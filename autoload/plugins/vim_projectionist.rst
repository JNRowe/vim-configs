``autoload/plugins/vim_projectionist.vim``
==========================================

.. include:: ../../.includes/scriptencoding.rst

.. function:: apply_commands() -> None

    Apply inline commands from projectionist templates.

    This allows you to include a normal mode command within a template by ending
    a line with the string ``]|[`` and followed by a normal mode command.  For
    example, ``]|[yyp`` would duplicate the current line.

::

    function plugins#vim_projectionist#apply_commands() abort
        execute printf('sign define PTemplateHighlight icon=%s text=TW',
        \              expand('~/.vim/icons/warning.png'))
        let l:curpos = getcurpos()
        call inputsave()
        while search('\]|\[')
            let l:s = sign_place(0, '', 'PTemplateHighlight', '%', {'lnum': '.', 'priority': 1000})
            let l:m = matchadd('WarningMsg', printf('\%%%dl^.*$', line('.')),
            \                  1000)
            redraw
            let [l:line, l:command] = split(getline('.'), ']|[')
            call setline('.', l:line)
            let l:q = input(printf('Execute ‘%s’? ', l:command))
            if l:q ==# 'y'
                execute 'normal ' . l:command
            endif
            call sign_unplace('', {'id': l:s})
            call matchdelete(l:m)
        endwhile
        call inputrestore()
        call setpos('.', l:curpos)
        sign undefine PTemplateHighlight
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
                    echo printf('Not setting “%s” from projection', l:optname)
                    echohl None
                endif
            endfor
        endfor
    endfunction
