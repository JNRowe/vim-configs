``localcfg/plugin_vim_space.vim``
=================================

Select mode mappings break snippets, so disable them::

    let g:space_disable_select_mode = v:true

Disable unused jump motions support::

    let g:space_no_jump = 1

.. note::

    I use jump motions so little that I’m willing to override :kbd:`<tab>` to
    :ref:`move between windows <window-management-maps>`.
