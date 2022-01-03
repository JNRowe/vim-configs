``localcfg/plugins/vim_clevertab.vim``
======================================

Configure preferred order of completion::

    let s:types = ['start', 'tab', 'keyword', 'omni', 'dictionary', 'stop']
    if has('insert_expand') && has('pythonx')
        let s:types = insert(s:types, 'ultisnips', 2)
    endif

    execute 'inoremap <silent> <Tab> ' .
    \   join(map(s:types,
    \            {_, v -> printf('<C-r>=CleverTab#Complete("%s")<CR>', v)}),
    \        '')
    inoremap <silent> <S-Tab> <C-r>=CleverTab#Complete('prev')<CR>
