``ftdetect/mutt.vim``
=====================

::

    augroup jnrowe_ftdetect
        autocmd BufRead,BufNewFile **/.config/neomutt/*.rc setfiletype neomuttrc
    augroup END
