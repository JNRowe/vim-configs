``localcfg/plugin_vim_gitgutter.vim``
=====================================

.. include:: ../.includes/scriptencoding.rst

.. code-block:: vim

    nnoremap [gitgutter] <Nop>
    nmap <Leader>g [gitgutter]

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

.. code-block:: vim

    let g:gitgutter_max_signs = 100

.. code-block:: vim

    if has('gui_running')
        let g:gitgutter_sign_added              = ''
        let g:gitgutter_sign_modified           = ''
        let g:gitgutter_sign_removed            = ''
        let g:gitgutter_sign_removed_first_line = '˙'
        let g:gitgutter_sign_modified_removed   = ''
    endif

.. code-block:: vim

    let g:gitgutter_override_sign_column_highlight = v:false

.. code-block:: vim

    highlight GitGutterAdd                        guifg=#8ae234
    highlight GitGutterChange                     guifg=#fce94f
    highlight GitGutterDelete                     guifg=#ef2929
    highlight GitGutterChangeDelete guibg=#ef2929 guifg=#fce94f
