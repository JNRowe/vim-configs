``vimrc.d/paths.vim``
=====================

.. include:: ../.includes/vim9script.rst

Find |XDG basedir| compliant locations for data files::

    var envvar = ''
    for [type, path] in [
        ['cache', '~/.cache'],
        ['config', '~/.config'],
        ['data', '~/.local/share'],
    ]
        envvar = printf('$XDG_%s_HOME', toupper(type))
        execute printf('const g:xdg_%s_dir = "%s"', type,
                       expand(exists(envvar) ? envvar : path))
    endfor

|vim| specific paths honouring |XDG basedir|::

    var varname = ''
    for name in ['cache', 'config', 'data']
        varname = 'vim_' .. name .. '_dir'
        execute printf('const g:%s = g:xdg_%s_dir .. "/vim"', varname, name)
        if !isdirectory(get(g:, varname))
            mkdir(get(g:, varname), 'p')
        endif
    endfor
