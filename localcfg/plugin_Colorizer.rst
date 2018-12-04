``localcfg/plugin_Colorizer.vim``
=================================

Enable automatic colourisation for filetypes that — for me — commonly contain
colour definitions.  ``moon`` is here because I use moonscript_ for *all* config
files that use lua_, and :command:`vim` is here because I often poke about in my
colour scheme.

::

    let g:colorizer_auto_filetype = 'css,less,moon,python,vim,xdefaults'

.. _moonscript: https://github.com/leafo/moonscript/
.. _lua: http://www.lua.org/
