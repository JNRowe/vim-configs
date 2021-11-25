``vimrc.d/paths.vim``
=====================

Find |XDG basedir| compliant locations for data files::

    for [s:type, s:path] in [
    \   ['cache', '~/.cache'],
    \   ['config', '~/.config'],
    \   ['data', '~/.local/share'],
    \ ]
        let s:var = 'g:xdg_' . s:type . '_dir'
        let s:envvar = '$XDG_' . toupper(s:type) . '_HOME'
        let s:value = expand(exists(s:envvar) ? s:envvar : s:path)
        execute 'let ' . s:var . ' = s:value'
    endfor

|vim| specific paths honouring |XDG basedir|::

    for s:name in ['cache', 'config', 'data']
        let s:path = 'vim_' . s:name . '_dir'
        execute 'let g:' . s:path . ' = g:xdg_' . s:name . "_dir . '/vim'"
        if !isdirectory(get(g:, s:path))
            call mkdir(get(g:, s:path), 'p')
        endif
    endfor
