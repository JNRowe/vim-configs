``vimrc.d/paths.vim``
=====================

Find |XDG basedir| compliant locations for data files::

    for [s:type, s:path] in [
    \   ['cache', '~/.cache'],
    \   ['config', '~/.config'],
    \   ['data', '~/.local/share'],
    \ ]
        let s:var = printf('g:xdg_%s_dir', s:type)
        let s:envvar = printf('$XDG_%s_HOME', toupper(s:type))
        let s:value = expand(exists(s:envvar) ? s:envvar : s:path)
        execute printf('let %s = s:value', s:var)
    endfor

|vim| specific paths honouring |XDG basedir|::

    for s:name in ['cache', 'config', 'data']
        let s:path = printf('vim_%s_dir', s:name)
        execute printf('let g:%s = "%s/vim"', s:path,
        \              get(g:, 'xdg_' . s:name . '_dir'))
        if !isdirectory(get(g:, s:path))
            call mkdir(get(g:, s:path), 'p')
        endif
    endfor
