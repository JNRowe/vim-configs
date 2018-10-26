``vimrc.d/localcfg.vim``
========================

Read all optional configs for build-dependent settings and external packages

.. code-block:: vim

    let g:localcfg_cfgs = []
    if has('localmap')
        let g:localcfg_cfgs += ['abbr']
    endif
    let g:localcfg_features = [
        \ 'autocmd', 'diff', 'gui_macvim', 'gui_running', 'menu', 'quickfix'
    \ ]
    for s:bundle in values(dein#get())
        let s:cfgname = 'plugin_' . substitute(s:bundle.name, '-', '_', 'g')
        let g:localcfg_cfgs += [(get(s:bundle, 'if', v:true) ? '' : 'not') . s:cfgname]
    endfo
    call localcfg#docfg()
