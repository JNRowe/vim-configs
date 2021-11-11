``after/ftplugin/sh.vim``
=========================

Add on-hover command definitions::

    if has('gui_running')
        command! -buffer CommandBalloon
        \   setlocal balloonexpr=display#commandballoon('whatis')
    endif

.. note::

    This isn’t set as the global default as :ref:`ale <ale-plugin>` provides
    a nice general balloon interface.  However, when dipping in to a shell
    script on an unususal system this can be useful.
