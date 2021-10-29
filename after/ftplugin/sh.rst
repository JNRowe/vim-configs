``after/ftplugin/sh.vim``
=========================

Add on-hover command definitions::

    if has('gui_running')
        command! -buffer CommandBalloon
            \ setlocal balloonexpr=misc#commandballoon('whatis')
    endif

.. note::

    This isn’t the default as :ref:`ale <ale-plugin>` provides a nice general
    usage for balloons, however occasionally when dipping in to a shell script
    on an unususal system this can be useful.
