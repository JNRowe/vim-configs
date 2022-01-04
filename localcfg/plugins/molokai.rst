``localcfg/plugins/molokai.vim``
================================

.. include:: ../../.includes/scriptversion.rst

Try to match original colour scheme in terminal::

    if !has('gui_running') && &t_Co >= 256
        const g:rehash256 = v:true
    endif
