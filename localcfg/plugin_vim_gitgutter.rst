``localcfg/plugin_vim_gitgutter.vim``
=====================================

.. include:: ../.includes/scriptencoding.rst

.. _vim-gitgutter-custom-maps:

Use my custom maps::

    call keymaps#mnemonic_map('gitgutter')
    let g:gitgutter_map_keys = v:false

    for [s:key, s:cmd] in [
    \   ['<Down>',  'NextHunk'],
    \   ['<Up>',    'PrevHunk'],
    \   ['<Space>', 'Toggle'],
    \   ['f',       'Fold'],
    \   ['p',       'PreviewHunk'],
    \   ['q',       'QuickFix'],
    \ ]
        execute 'nnoremap <silent> [gitgutter]<' . s:key . '> '
        \   ':GitGutter' . s:cmd . '<CR>'
    endfor

If you have more than one-hundred edits you need to commit, not look at symbols!

::

    let g:gitgutter_max_signs = 100

Use location list for ``:GitGutterQuickFix`` output::

    let g:gitgutter_use_location_list = v:true

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

Use a sign colour scheme that approximately matches my terminal :command:`diff`
output::

    highlight GitGutterAdd                        guifg=#8ae234
    highlight GitGutterChange                     guifg=#fce94f
    highlight GitGutterDelete                     guifg=#ef2929
    highlight GitGutterChangeDelete guibg=#ef2929 guifg=#fce94f

Use fancy icons for signs, if possible::

    if has('gui_running')
        for [s:icon, s:signs] in items({
        \   'list-add': ['Added'],
        \   'edit-copy': ['Modified'],
        \   'list-remove': ['Removed', 'RemovedFirstLine',
        \                   'ModifiedRemoved']
        \ })
            for s:sign in s:signs
                execute 'sign define GitGutterLine' . s:sign .
                \   ' icon=' . expand('~/.vim/icons/' . s:icon . '.png')
            endfor
        endfor
    endif
