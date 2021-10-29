``localcfg/plugin_dwm.vim.vim``
===============================

.. _dwm-custom-maps:

Use my custom maps::

    let g:dwm_map_keys = v:false

    call misc#mnemonicmap('dwm')

.. tip::

    Imagine :kbd:`<Up>` increases window count, and :kbd:`<Down>`… well, yeah.

::

    for [s:key, s:cmd] in [
        \   ['n',       'New'],
        \   ['c',       ':exe DWM_Close'],
        \   ['f',       'Focus'],
        \   ['<Left>',  'Rotate(0)'],
        \   ['<Right>', 'Rotate(1)'],
        \   ['<Up>',    'New'],
        \   ['<Down>',  ':exe DWM_Close'],
        \ ]
        if stridx(s:cmd, '(') == -1
            let s:cmd .= '()'
        endif
        if s:cmd[0] !=# ':'
            let s:cmd = 'call DWM_' . s:cmd
        else
            let s:cmd = s:cmd[1:]
        endif

        execute 'nnoremap <silent> [dwm]' . s:key . ' :<C-u>' . s:cmd . '<CR>'
    endfor
