``localcfg/plugins/vim_matchup.vim``
====================================

.. include:: ../../.includes/scriptversion.rst

Disable parenthesis matching as we’re using :ref:`rainbow <rainbow-plugin>`::

    const g:matchup_matchparen_enabled = v:false

Don’t match *in to* HTML child elements::

    const g:matchup_matchpref = #{html: #{nolists: v:true}}

Use a popup to show matches beyond the screen::

    if has('popupwin')
        let g:matchup_matchparen_offscreen = #{method: 'popup'}
    endif
