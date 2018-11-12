``ftplugin/help.vim``
=====================

Issue an immediate “split to right” for help buffers::

    if has('vertsplit')
        wincmd L
    endif

.. note::

    This really annoys me with portrait screens, but I’ve not thought of
    a *good* way to handle that yet.
