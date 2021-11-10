``localcfg/plugin_ultisnips.vim``
=================================

I find :repo:`vim-clevertab <neitanod/vim-clevertab>` performs largely :doc:`how
I want <plugin_vim_clevertab>`, but occasionally I’ll jump straight to snippet
expansion::

    let g:UltiSnipsExpandTrigger = '<C-j>'

.. tip::

    This can be considerably quicker than just using :kbd:`<Tab>` when you have
    ``'complete'`` configured with a large wordlist and/or thesaurus, such as
    when editing prose.

Open snippet editor in a separate window::

    let g:UltiSnipsEditSplit = 'context'

Disable :repo:`ale <dense-analysis/ale>` while editing snippet output::

    function! s:change_ale_state(enable) abort
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

    augroup jnrowe_ultisnips
        autocmd!
        autocmd User UltiSnipsEnterFirstSnippet
        \   call <SID>change_ale_state(v:false)
        autocmd User UltiSnipsExitLastSnippet
        \   call <SID>change_ale_state(v:true)
    augroup END
