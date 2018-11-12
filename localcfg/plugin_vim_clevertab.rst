``localcfg/plugin_vim_clevertab.vim``
=====================================

Configure preferred order of completion::

    inoremap <silent><Tab> <C-r>=CleverTab#Complete('start')<CR>
        \<C-r>=CleverTab#Complete('tab')<CR>
        \<C-r>=CleverTab#Complete('ultisnips')<CR>
        \<C-r>=CleverTab#Complete('keyword')<CR>
        \<C-r>=CleverTab#Complete('omni')<CR>
        \<C-r>=CleverTab#Complete('stop')<CR>
    inoremap <silent><S-Tab> <R-r>=CleverTab#Complete('prev')<CR>
