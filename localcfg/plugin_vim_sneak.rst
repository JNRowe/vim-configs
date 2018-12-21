``localcfg/plugin_vim_sneak.vim``
=================================

Disable cursor highlighting::

    function! s:sneak_enter()
        let b:sneak_cursorcolumn = &cursorcolumn
        let b:sneak_cursorline = &cursorline
        set nocursorcolumn nocursorline
    endfunction
    function! s:sneak_leave()
        execute 'set ' .
            \ (b:sneak_cursorcolumn ? '' : 'no') . 'cursorcolumn ' .
            \ (b:sneak_cursorline ? '' : 'no') . 'cursorline'
        unlet b:sneak_cursorcolumn b:sneak_cursorline
    endfunction

    autocmd User SneakEnter call s:sneak_enter()
    autocmd User SneakLeave call s:sneak_leave()
