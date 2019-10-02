``localcfg/plugin_FastFold.vim``
================================

Use ``FastFold`` for *all* files::

    let g:fastfold_minlines = 0

To prevent breakages when saving and restoring sessions::

    set sessionoptions-=folds

Text objects for folds::

    for [s:key, s:sel] in [['i', 'v'], ['a', 'V']]
        execute 'xnoremap <silent> ' . s:key . 'z '
            \ ':<C-u>FastFoldUpdate<CR><ESC>'
            \ ':<C-u>normal! ]z' . s:sel . '[z<CR>'
    endfor
