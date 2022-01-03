``ftdetect/git-fiddle.vim``
===========================

.. include:: ../.includes/scriptversion.rst

Treat git-fiddle_ buffers as :command:`git rebase` files::

    " vint: -ProhibitAutocmdWithNoGroup
    autocmd BufRead,BufNewFile */git-rebase-todo.fiddle
    \   setfiletype gitrebase.gitfiddle
    " vint: +ProhibitAutocmdWithNoGroup

.. note::

    This could do with a little extra finesse, but works well in the main.

.. _git-fiddle: https://github.com/felixSchl/git-fiddle
