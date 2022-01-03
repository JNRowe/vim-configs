``after/ftplugin/make.vim``
===========================

.. include:: ../../.includes/scriptversion.rst

``'smarttab'`` is *amazingly* useful everywhere a :kbd:`<Tab>` isn’t
a surprise waiting to happen, such as a :file:`Makefile`::

    call filetypes#apply_ftplugin('nosmarttab')

.. seealso::

    * :func:`filetypes#apply_ftplugin() <apply_ftplugin>`
