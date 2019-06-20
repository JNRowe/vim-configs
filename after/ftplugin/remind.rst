``after/ftplugin/remind.vim``
=============================

Just in case a ``'cms'`` value gets added to the upstream plugin, we’ll force
this as it would break too many scripts that are relying on post-processing the
remind_ data::

    setlocal commentstring=#%s
    execute 'let b:undo_ftplugin ' .
        \ (exists('b:undo_ftplugin') ? '.= "|' : '= "') .
        \ 'setlocal commentstring<"'

.. note::

    I’m not saying this is a good idea, just that I don’t have write access to
    fix the external tools to support the real commenting features :/

.. _remind: http://www.roaringpenguin.com/products/remind
