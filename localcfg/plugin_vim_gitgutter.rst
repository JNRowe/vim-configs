``localcfg/plugin_vim_gitgutter.vim``
=====================================

.. include:: ../.includes/scriptencoding.rst

Use my custom maps::

    call MnemonicMap('gitgutter')
    let g:gitgutter_map_keys = v:false

    for [s:key, s:cmd] in [
        \   ['Down',  'NextHunk'],
        \   ['Up',    'PrevHunk'],
        \   ['Space', 'Toggle'],
        \ ]
        execute 'nnoremap <silent> [gitgutter]<' . s:key . '> '
            \ ':GitGutter' . s:cmd . '<CR>'
    endfor
    nnoremap <silent> [gitgutter]p :GitGutterPreviewHunk<CR>

If you have more than 100 edits you probably need to commit!

::

    let g:gitgutter_max_signs = 100

.. include:: ../.includes/fontawesome.rst

Configure symbols::

    if has('gui_running')
        let g:gitgutter_sign_added              = ''
        let g:gitgutter_sign_modified           = ''
        let g:gitgutter_sign_removed            = ''
        let g:gitgutter_sign_removed_first_line = '˙'
        let g:gitgutter_sign_modified_removed   = ''
    endif

.. include:: ../.includes/fancy_symbols.rst

I prefer my colour scheme’s sign column setup::

    let g:gitgutter_override_sign_column_highlight = v:false

Use a sign colour scheme that approximately matches my terminal diff output::

    highlight GitGutterAdd                        guifg=#8ae234
    highlight GitGutterChange                     guifg=#fce94f
    highlight GitGutterDelete                     guifg=#ef2929
    highlight GitGutterChangeDelete guibg=#ef2929 guifg=#fce94f

Use fancy icons for signs if possible::

    if has('gui_running')
        for [s:icon, s:signs] in items({
            \   'list-add': ['Added'],
            \   'edit-copy': ['Modified'],
            \   'list-remove': ['Removed', 'RemovedFirstLine', 'ModifiedRemoved']
            \ })
            for s:sign in s:signs
                execute 'sign define GitGutterLine' . s:sign .
                    \ ' icon=' . expand('~/.vim/icons/' . s:icon . '.png')
            endfor
        endfor
    endif
