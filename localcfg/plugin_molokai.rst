``localcfg/plugin_molokai.vim``
===============================

Try to match original colour scheme in terminal::

    if !has('gui_running') && &t_Co >= 256
        let g:rehash256 = v:true
    endif
