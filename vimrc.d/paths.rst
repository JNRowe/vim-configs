``vimrc.d/paths.vim``
=====================

Find `XDG basedir`_ compliant locations for data files::

    for [s:type, s:path] in [
        \   ['cache', '~/.cache'],
        \   ['config', '~/.config'],
        \   ['data', '~/.local/share'],
        \ ]
        let s:var = 'g:xdg_' . s:type . '_dir'
        let s:envvar = '$XDG_' . toupper(s:type) . '_HOME'
        execute 'let ' . s:var . ' = '
            \ 'expand(empty(' . s:envvar . ') ? "' . s:path . '" : "' . s:envvar . '")'
    endfor

:command:`vim` specific paths honouring `XDG basedir`_::

    for s:name in ['cache', 'config', 'data']
        let s:path = 'vim_' . s:name . '_dir'
        execute 'let g:' . s:path . ' = g:xdg_' . s:name . "_dir . '/vim'"
        if !isdirectory(get(g:, s:path))
            call mkdir(get(g:, s:path), 'p')
        endif
    endfor

.. _XDG basedir: http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
