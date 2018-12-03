``localcfg/plugin_switch.vim.vim``
==================================

Use :kbd:`<C-M-T>` to flip word under cursor::

    for [s:mode, s:cmd_prefix] in [
        \   ['i', '<C-O>'],
        \   ['n', ''],
        \   ['v', '<ESC>'],
        \ ]
        execute s:mode . 'noremap <C-M-T> ' . s:cmd_prefix .
            \ ':Switch<CR>'
    endfor
