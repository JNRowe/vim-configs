``after/ftplugin/c.vim``
========================

Use ``:make`` to compile C/C++, even without a Makefile

.. code-block:: vim

    if !filereadable('Makefile')
        setlocal makeprg=gcc\ -o\ %<\ %
    endif
