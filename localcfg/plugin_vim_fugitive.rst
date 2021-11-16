``localcfg/plugin_vim_fugitive.vim``
====================================

Add map to change directory to git_ project root using :repo:`vim-projectionist
<tpope/vim-projectionist>`::

    nmap <silent> <C-p> :Gcd<CR>

.. note::

    I never use :kbd:`<C-p>` or :kbd:`<C-n>` for navigation, as :command:`vim`
    generally offers far more useful navigation, and anyway you can still move
    up with :kbd:`k`.

.. _git: https://git-scm.com/
