``localcfg/plugins/vim_peekaboo.vim``
=====================================

When I know the register I’m aiming for I’ll hit it quick enough to still see an
annoying flash, so skip the display for short delays::

    let g:peekaboo_delay = 250

Show compact register list in when in short windows::

    augroup jnrowe_vim_peekaboo
        autocmd!
        autocmd VimResized * if dein#get('vim-peekaboo').sourced |
        \       call plugins#vim_peekaboo#set_compact() |
        \   endif
    augroup END

.. seealso::

    * :func:`plugins#vim_peekaboo#set_compact() <set_header_display>`
