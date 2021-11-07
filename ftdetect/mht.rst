``ftdetect/mht.vim``
====================

Treat :wikipedia:`MHTML` documents as |HTML|::

    " vint: -ProhibitAutocmdWithNoGroup
    autocmd BufRead,BufNewFile *.mht setfiletype FALLBACK html
    autocmd BufRead,BufNewFile *.mhtml set filetype=html
    " vint: +ProhibitAutocmdWithNoGroup

.. note::

    This is hardly a good interface for editing ``.mht{,ml}`` files, but for my
    use case of a quick edit it works fine.
