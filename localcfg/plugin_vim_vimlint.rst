``localcfg/plugin_vim_vimlint.vim``
===================================

I prefer quickfix integration::

    let g:vimlint#config = {'output': 'quickfix'}

… and don’t need to see timing info::

    let g:vimlint#config.quiet = v:true

… and need a push to use ``abort``::

    let g:vimlint#config.func_abort = v:true
