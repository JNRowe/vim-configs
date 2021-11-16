``ftdetect/mht.vim``
====================

Treat :wikipedia:`MHTML` documents as |HTML|::

    " vint: -ProhibitAutocmdWithNoGroup
    autocmd BufRead,BufNewFile *.mht setfiletype FALLBACK html
    autocmd BufRead,BufNewFile *.mhtml setfiletype html
    " vint: +ProhibitAutocmdWithNoGroup

.. note::

    This overrides detection for ``*.mhtml`` files as :command:`vim` will select
    the ``mason`` filetype(which I’ve never seen in the wild).

.. note::

    This is hardly a good interface for editing ``.mht{,ml}`` files given
    that their contents are :abbr:`MIME (Multipurpose Internet Mail
    Extension)` encoded, but for my use case of a quick edit it works fine.
