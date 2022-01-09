``localcfg/plugins/vim_mundo.vim``
==================================

.. include:: ../../.includes/scriptversion.rst

Use my custom maps::

    nnoremap <LocalLeader># <Cmd>MundoToggle<CR>

Configure look::

    const g:mundo_header = v:false
    const g:mundo_preview_bottom = v:true
    const g:mundo_right = v:true

If |Python| 3 is available then use it::

    if has('python3')
        const g:mundo_prefer_python3 = v:true
    endif
