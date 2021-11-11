``vimrc.d/localcfg.vim``
========================

Prepare localcfg_ to read all optional configuration files::

    let g:localcfg_cfgs = []

… for build-dependent settings::

    if has('localmap')
        let g:localcfg_cfgs += ['abbr']
    endif
    let g:localcfg_features = [
    \   'autocmd', 'diff', 'gui_macvim', 'gui_running', 'menu', 'quickfix',
    \   'spell'
    \ ]

… and :repo:`dein <Shougo/dein.vim>` managed packages::

    for s:name in keys(dein#get())
        let s:cfgname = 'plugin_' . substitute(s:name, '-', '_', 'g')
        let g:localcfg_cfgs += [s:cfgname, ]
    endfor

Read defined configuration files::

    call localcfg#docfg()

.. _localcfg: https://gitlab.com/magus/localcfg/
