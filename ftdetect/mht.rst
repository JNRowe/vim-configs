``ftdetect/mht.vim``
====================

Treat :wikipedia:`MHTML` documents as :abbr:`HTML (HyperText Markup Language)`::

    augroup jnrowe_ftdetect
        autocmd BufRead,BufNewFile *.mht setfiletype FALLBACK html
        autocmd BufRead,BufNewFile *.mhtml set filetype=html
    augroup END

.. note::

    This is hardly a good interface for editing ``.mht{,ml}`` files, but for my use
    case of a quick edit it works fine.
