``localcfg/plugins/vim_speeddating.vim``
========================================

.. include:: ../../.includes/scriptversion.rst

I need only :rfc:`2822`, :command:`git` and a limited collection of
|ISO-8601| variants.  One annoying mismatch happened *once*, and here we are…

::

    const g:speeddating_formats = [
    \   ['%i, %d %h %Y %H:%M:%S %z', 0, 0],
    \   ['%a %h %-d %H:%M:%S %Y %z', 0, 0],
    \   ['%Y-%m-%d%[ T]%H:%M:%S %z', 0, 0],
    \   ['%Y-%m-%d%[ T]%H:%M:%S%?[Z]', 0, 0],
    \   ['%Y-%m-%d%[ T]%H:%M%z', 0, 0],
    \   ['%Y-%m-%d%[ T]%H:%M', 0, 0],
    \   ['%Y-%m-%d', 0, 0],
    \   ['%H:%M:%S', 0, 0]
    \ ]
