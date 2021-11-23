``localcfg/plugin_vim_matchup.vim``
===================================

Disable parenthesis matching as we’re using :ref:`rainbow <rainbow-plugin>`::

    let g:matchup_matchparen_enabled = v:false

Don’t match *in to* HTML child elements::

    let g:matchup_matchpref = {'html': {'nolists': v:true}}
