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

    for s:bundle in values(dein#get())
        let s:enabled = get(s:bundle, 'if', v:true)
        let s:cfgname = 'plugin_' . substitute(s:bundle.name, '-', '_', 'g')
        let g:localcfg_cfgs += [(s:enabled ? '' : 'not') . s:cfgname]
    endfor

.. note::

    The logic here is that packages with requirements can have optional negative
    configuration files that trigger alternative functionality when they’re not
    available.

Read defined configuration files::

    call localcfg#docfg()

.. _localcfg: https://gitlab.com/magus/localcfg/
