``vimrc.d/localcfg.vim``
========================

Prepare localcfg_ to read all optional configs::

    let g:localcfg_cfgs = []

… for build-dependent settings::

    if has('localmap')
        let g:localcfg_cfgs += ['abbr']
    endif
    let g:localcfg_features = [
        \ 'autocmd', 'diff', 'gui_macvim', 'gui_running', 'menu', 'quickfix'
    \ ]

… and dein_ managed packages::

    for s:bundle in values(dein#get())
        let s:cfgname = 'plugin_' . substitute(s:bundle.name, '-', '_', 'g')
        let g:localcfg_cfgs += [(get(s:bundle, 'if', v:true) ? '' : 'not') . s:cfgname]
    endfor

.. note::

    The logic here is that packages with requirements can have optional negative
    configs that trigger alternative functionality when they’re not available.

Read defined configs::

    call localcfg#docfg()

.. _localcfg: https://gitlab.com/magus/localcfg/
.. _dein: https://github.com/Shougo/dein.vim/
