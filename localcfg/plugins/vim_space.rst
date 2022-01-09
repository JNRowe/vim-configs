``localcfg/plugins/vim_space.vim``
==================================

.. include:: ../../.includes/scriptversion.rst

Select mode mappings break snippets, so disable them::

    const g:space_disable_select_mode = v:true

Disable unused jump motions support::

    const g:space_no_jump = 1

.. note::

    I use jump motions so little that I’m willing to override :kbd:`<tab>` to
    :ref:`move between windows <window-management-maps>`.
