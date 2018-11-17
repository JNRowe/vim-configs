``ftdetect/mht.vim``
====================

Treat :wikipedia:`MHTML` documents as :abbr:`HTML (HyperText Markup Language)`::

    augroup jnrowe_ftdetect
        autocmd BufRead,BufNewFile *.mht setfiletype FALLBACK html
    augroup END

.. note::

    This is hardly a good interface for editing ``.mht`` files, but for my use
    case of a quick edit it works fine.
