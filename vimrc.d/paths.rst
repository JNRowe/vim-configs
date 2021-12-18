``vimrc.d/paths.vim``
=====================

Find |XDG basedir| compliant locations for data files::

    for [s:type, s:path] in [
    \   ['cache', '~/.cache'],
    \   ['config', '~/.config'],
    \   ['data', '~/.local/share'],
    \ ]
        let s:envvar = printf('$XDG_%s_HOME', toupper(s:type))
        let g:xdg_{s:type}_dir = expand(exists(s:envvar) ? s:envvar : s:path)
    endfor

|vim| specific paths honouring |XDG basedir|::

    for s:name in ['cache', 'config', 'data']
        let g:vim_{s:name}_dir = g:xdg_{s:name}_dir . '/vim'
        if !isdirectory(g:vim_{s:name}_dir)
            call mkdir(g:vim_{s:name}_dir, 'p')
        endif
    endfor
