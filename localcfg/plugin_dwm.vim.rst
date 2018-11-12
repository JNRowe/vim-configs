``localcfg/plugin_dwm.vim.vim``
===============================

Use my custom maps::

    let g:dwm_map_keys = v:false

    call MnemonicMap('dwm')

.. tip::

    Imagine :kbd:`<Up>` increases window count, and :kbd:`<Down>`… well, yeah.

::

    for [s:key, s:cmd] in [
        \   ['n',       'New'],
        \   ['c',       ':exe DWM_Close'],
        \   ['f',       'Focus'],
        \   ['<left>',  'Rotate(0)'],
        \   ['<right>', 'Rotate(1)'],
        \   ['<up>',    'New'],
        \   ['<down>',  ':exe DWM_Close'],
        \ ]
        if stridx(s:cmd, '(') == -1
            let s:cmd .= '()'
        endif
        if s:cmd[0] != ':'
            let s:cmd = 'call DWM_' . s:cmd
        else
            let s:cmd = s:cmd[1:]
        endif

        execute 'nnoremap <silent> [dwm]' . s:key . ' :<C-u>' . s:cmd . '<CR>'
    endfor
