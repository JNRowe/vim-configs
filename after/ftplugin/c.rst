``after/ftplugin/c.vim``
========================

.. include:: ../../.includes/scriptversion.rst

Use ``:make`` to compile C/C++, even without a Makefile::

    if !filereadable('Makefile')
        call filetypes#apply_ftplugin('makeprg=gcc -o %< %')
    endif

.. seealso::

    * :func:`filetypes#apply_ftplugin() <apply_ftplugin>`

Add a little whitespace to comments::

    call filetypes#apply_ftplugin('commentstring=/* %s */')

.. seealso::

    * :func:`filetypes#apply_ftplugin() <apply_ftplugin>`

Re-add ``C`` includes :ref:`where they’re useful <path-setting>`::

    setlocal path+=/usr/include
