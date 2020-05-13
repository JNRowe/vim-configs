``localcfg/plugin_vim_orgmode.vim``
===================================

I'm clearly *so* :command:`vim` at this point that jump to insert mode tends to
irk me::

    let g:org_prefer_insert_mode = v:false

Match keywords with those used by co-workers::

    let g:org_todo_keywords = [
        \ 'TODO(t)', 'NEXT(n)', 'STARTED(s)', 'HOLD(h)',
        \ '|',
        \ 'DONE(d)', 'CANCELLED(c)', 'REJECTED(r)',
    \]


I really like conceal in all buffers, but in ``.org`` files they’re
essential::

    let g:org_aggressive_conceal = v:true
