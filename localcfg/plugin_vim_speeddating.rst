``localcfg/plugin_vim_speeddating.vim``
=======================================

I need only :rfc:`2822`, :command:`git` and a limited collection of ISO-8601_
variants.  One mismatch happened *once*, and here we are…

.. code-block:: vim

    let g:speeddating_formats = [
        \ ['%i, %d %h %Y %H:%M:%S %z', 0, 0],
        \ ['%a %h %-d %H:%M:%S %Y %z', 0, 0],
        \ ['%Y-%m-%d%[ T]%H:%M:%S %z', 0, 0],
        \ ['%Y-%m-%d%[ T]%H:%M:%S%?[Z]', 0, 0],
        \ ['%Y-%m-%d%[ T]%H:%M%z', 0, 0],
        \ ['%Y-%m-%d%[ T]%H:%M', 0, 0],
        \ ['%Y-%m-%d', 0, 0],
        \ ['%H:%M:%S', 0, 0]
    \ ]

.. _ISO-8601: https://en.m.wikipedia.org/wiki/ISO_8601
