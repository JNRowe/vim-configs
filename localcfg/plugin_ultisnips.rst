``localcfg/plugin_ultisnips.vim``
=================================

I find :repo:`vim-clevertab <neitanod/vim-clevertab>` performs largely :doc:`how
I want <plugin_vim_clevertab>`, but occasionally I’ll jump straight to snippet
expansion::

    let g:UltiSnipsExpandTrigger = '<C-j>'

.. tip::

    This can be considerably quicker than just using :kbd:`<Tab>` when
    you have ``'complete'`` configured with a large wordlist and/or
    thesaurus, such as when editing prose.
