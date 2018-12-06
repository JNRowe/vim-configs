``localcfg/plugin_Colorizer.vim``
=================================

Enable automatic colourisation for filetypes that — for me — commonly contain
colour definitions.  ``moon`` is here because I use :repo:`moonscript
<leafo/moonscript>` for *all* config files that use lua_, and :command:`vim` is
here because I often poke about in my colour scheme.

::

    let g:colorizer_auto_filetype = 'css,less,moon,python,vim,xdefaults'

.. _lua: http://www.lua.org/
