``localcfg/plugins/ultisnips.vim``
==================================

.. include:: ../../.includes/scriptversion.rst

I find :repo:`vim-clevertab <neitanod/vim-clevertab>` performs largely :doc:`how
I want <vim_clevertab>`, but occasionally I’ll jump straight to snippet
expansion::

    let g:UltiSnipsExpandTrigger = '<C-j>'

.. tip::

    This can be considerably quicker than just using :kbd:`<Tab>` when you have
    ``'complete'`` configured with a large wordlist and/or thesaurus, such as
    when editing prose.

Open snippet editor in a separate window::

    let g:UltiSnipsEditSplit = 'context'

Disable :repo:`ale <dense-analysis/ale>` while editing snippet output::

    augroup jnrowe_ultisnips
        autocmd!
        autocmd User UltiSnipsEnterFirstSnippet
        \   call plugins#ultisnips#set_ale_state(v:false)
        autocmd User UltiSnipsExitLastSnippet
        \   call plugins#ultisnips#set_ale_state(v:true)
    augroup END

.. seealso::

    * :func:`plugins#ultisnips#set_ale_state() <set_ale_state>`
