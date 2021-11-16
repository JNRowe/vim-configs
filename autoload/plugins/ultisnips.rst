``autoload/plugins/ultisnips.vim``
==================================

.. function:: toggle_ale_state(enable: bool) -> None

    Toggle :repo:`ale <dense-analysis/ale>` state.

    :param enable: If truthy, re-enable ``ale`` if previously set

::

    function! plugins#ultisnips#toggle_ale_state(enable) abort
        if a:enable == v:true
            if b:ultiale_state == v:true
                ALEEnableBuffer
            endif
            unlet b:ultiale_state
        else
            if get(b:, 'ale_enabled', get(g:, 'ale_enabled')) == v:true
                let b:ultiale_state = v:true
                ALEDisableBuffer
            endif
        endif
    endfunction
