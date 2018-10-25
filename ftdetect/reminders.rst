``ftdetect/reminders.vim``
==========================

.. code-block:: vim

    augroup jnrowe_ftdetect
        autocmd BufRead,BufNewFile ~/.reminders.d/* setfiletype remind
    augroup END
