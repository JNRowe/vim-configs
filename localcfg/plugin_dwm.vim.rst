``localcfg/plugin_dwm.vim.vim``
===============================

.. _dwm-custom-maps:

Use my custom maps::

    let g:dwm_map_keys = v:false

    call keymaps#mnemonic_map('dwm')

.. seealso::

    * :func:`keymaps#mnemonic_map() <mnemonic_map>`

Configure maps to match, to some degree, my window manager’s configuration::

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

.. tip::

    Imagine :kbd:`<Up>` increases window count, and :kbd:`<Down>`… well, yeah.
