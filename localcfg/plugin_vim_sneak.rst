``localcfg/plugin_vim_sneak.vim``
=================================

Enable label mode::

    let g:sneak#label = 1

Disable cursor highlighting while active::

    augroup jnrowe_vim_sneak
        autocmd!
        autocmd User SneakEnter call plugins#vim_sneak#sneak_enter()
        autocmd User SneakLeave call plugins#vim_sneak#sneak_leave()
    augroup END

.. seealso::

    * :func:`plugins#vim_sneak#sneak_enter() <sneak_enter>`
    * :func:`plugins#vim_sneak#sneak_leave() <sneak_leave>`
