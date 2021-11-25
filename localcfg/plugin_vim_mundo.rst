``localcfg/plugin_vim_mundo.vim``
=================================

Use my custom maps::

    nnoremap <silent> <LocalLeader># :MundoToggle<CR>

Configure look::

    let g:mundo_header = v:false
    let g:mundo_preview_bottom = v:true
    let g:mundo_right = v:true

If |Python| 3 is available then use it::

    if has('python3')
        let g:mundo_prefer_python3 = v:true
    endif
