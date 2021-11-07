``localcfg/plugin_vim_mundo.vim``
=================================

::

    nnoremap <LocalLeader># :MundoToggle<CR>

Configure look::

    let g:mundo_header = v:false
    let g:gundo_preview_bottom = v:true
    let g:mundo_right = v:true

If |Python| 3 is available use it::

    if has('python3')
        let g:mundo_prefer_python3 = v:true
    endif
