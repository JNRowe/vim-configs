``localcfg/plugin_vim_projectionist.vim``
=========================================

:envvar:`PKG_LICENSE_DIR` is set on many of the systems I use to
a distro-specific location for licenses; :file:`/usr/share/licenses`,
``/var/lib/repos/gentoo/licenses``, &c.  This allows us to set up some global
templates for licence generation at a project’s top level::

    if exists('$PKG_LICENSE_DIR')
        let s:project_root_heuristic = 'Makefile|all.do|build.py|setup.py'
        let g:projectionist_heuristics = {s:project_root_heuristic: {}}
        for [s:f, s:t] in [
            \   ['COPYING', 'GPL-3'],
            \   ['COPYING.LIB', 'LGPL-3'],
            \   ['LICENSE', 'MIT']
            \ ]
            let g:projectionist_heuristics[s:project_root_heuristic][s:f] = {
                \   'template': readfile(expand('$PKG_LICENSE_DIR/') . s:t),
                \   'type': tolower(split(s:t, '-')[0]),
                \ }
        endfor
    endif

.. note::

    If I used licenses where there wasn't a unique convention for the filename
    then I'd need something more powerful, but I don't.
