``localcfg/plugin_vim_sneak.vim``
=================================

Enable label mode::

    let g:sneak#label = 1

Disable cursor highlighting while ``vim-sneak`` is active::

    function! s:sneak_enter() abort
        let b:sneak_cursorcolumn = &cursorcolumn
        let b:sneak_cursorline = &cursorline
        set nocursorcolumn nocursorline
    endfunction
    function! s:sneak_leave() abort
        let &cursorcolumn = b:sneak_cursorcolumn
        let &cursorline = b:sneak_cursorline
        unlet b:sneak_cursorcolumn b:sneak_cursorline
    endfunction

    augroup jnrowe_vim_sneak
        autocmd!
        autocmd User SneakEnter call <SID>sneak_enter()
        autocmd User SneakLeave call <SID>sneak_leave()
    augroup END
