``localcfg/plugin_vim_maximizer.vim``
=====================================

Use my custom maps::

    let g:maximizer_set_default_mapping = v:false

Override the default window maximise binding::

    nnoremap <silent> <C-w>o :MaximizerToggle<CR>
