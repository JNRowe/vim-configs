``after/ftplugin/sh.vim``
=========================

.. include:: ../../.includes/scriptversion.rst

Add on-hover command definitions::

    if has('gui_running')
        command! -buffer CommandBalloon
        \   setlocal balloonexpr=display#command_balloon('whatis')
    endif

.. image:: /.static/sh_command_balloon.png
   :alt: Example of shell script balloon help

.. seealso::

    * :func:`display#command_balloon() <command_balloon>`

.. note::

    This isn’t set as the global default as :ref:`ale <ale-plugin>` provides
    a nice general balloon interface.  However, when dipping in to a shell
    script on an unusual system this can be useful.
