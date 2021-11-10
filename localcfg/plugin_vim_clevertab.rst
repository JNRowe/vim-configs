``localcfg/plugin_vim_clevertab.vim``
=====================================

Configure preferred order of completion::

    let s:types = ['start', 'tab', 'keyword', 'omni', 'dictionary', 'stop']
    if has('insert_expand') && has('pythonx') && v:version >= 704
        let s:types = insert(s:types, 'ultisnips', 2)
    endif

    execute 'inoremap <silent> <Tab> ' .
    \   join(map(s:types,
    \            {_, v -> '<C-r>=CleverTab#Complete("' . v . '")<CR>'}),
    \        '')
    inoremap <silent> <S-Tab> <C-r>=CleverTab#Complete('prev')<CR>
