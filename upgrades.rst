Pending changes
===============

This document lists the things that are coming down the pipeline that interest
me.  It should be noted that all of them already exist in released patches, but
they’re not available in the environments I use yet.  I keep this file around to
remind me of the things I’m missing out on, and what I need to work on when
I upgrade.

.. todo::

    Add ``:tlmenu`` support to :doc:`localcfg/menu`, see 8.1.0487.

.. todo::

    Switch to the ``..`` string concatenation, see 8.1.1114.  This
    *simple* change is huge for readability, and I’m tempted to upgrade simply
    for it.

.. todo::

    Support for ``:scriptversion``, see 8.1.1116.

    Test with ``has('vimscript-3')``.

.. todo::

    Switch to ``str2list()`` and ``list2str()``, see 8.1.1122.

.. todo::

    Add bindings for ``:cafter`` and ``:cbefore``, see 8.1.1275.

.. todo::

    Use default functions arguments where it makes sense(such as in
    ``misc#mnemonicmap()``), see 8.1.1310.

.. todo::

    Use ``:const`` for values that shouldn’t be changed, see 8.1.1539.

.. todo::

    Switch to the *far* nicer ``#{key: value}`` syntax, see 8.1.1683.

.. last seen: 1685
