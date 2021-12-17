``after/ftplugin/gitfiddle.vim``
================================

.. include:: ../../.includes/scriptencoding.rst

We can treat git-fiddle_ as a :command:`git rebase` file for the :doc:`most part
<../../ftdetect/git-fiddle>`, but we’ll also need a few of the things from the
:doc:`git commit setup <gitcommit>` to make things comfortable.

.. todo::

    This should probably include trailer support, but so far I’m willing to fall
    back on switching to a rebase ``reword`` command when necessary.  The
    alternative would be a *hefty* chunk of code to make trailers work in the
    :command:`git fiddle` commit template boundaries.

.. include:: ../../.includes/gitcommit_emoji.rst

.. _git-fiddle: https://github.com/felixSchl/git-fiddle
