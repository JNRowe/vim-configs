``after/ftplugin/remind.vim``
=============================

.. include:: ../../.includes/scriptversion.rst

Just in case a ``'cms'`` value gets added to the upstream plugin, we’ll force
this as it would break too many scripts that are relying on post-processing the
|remind| data::

    call filetypes#apply_ftplugin('commentstring=#%s')

.. seealso::

    * :func:`filetypes#apply_ftplugin() <apply_ftplugin>`

.. note::

    I’m not saying this is a good idea, just that I don’t have write access to
    fix the external tools to support the full range of commenting features in
    |remind|.
