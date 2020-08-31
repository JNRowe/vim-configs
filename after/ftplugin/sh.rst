``after/ftplugin/sh.vim``
=========================

Add on-hover command definitions::

    function! s:command_balloon() abort
        return systemlist('whatis ' . v:beval_text)
    endfunction
    if has('gui_running')
        command CommandBalloon! setlocal balloonexpr=<SID>command_balloon()
    endif

.. note::

    This isn’t the default as :ref:`ale <ale-plugin>` provides a nice general
    usage for balloons, however occasionally when dipping in to a shell script
    on an unususal this can be useful.
