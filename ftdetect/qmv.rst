``ftdetect/qmv.vim``
====================

Switch directory to shell’s current directory when editing renameutils_
buffers to make completion work correctly::

    " vint: -ProhibitAutocmdWithNoGroup
    autocmd BufRead $TMP/qmv* cd $PWD | set noautochdir
    " vint: +ProhibitAutocmdWithNoGroup

This *really* screws with the session, but it shouldn’t matter as :command:`qmv`
opens a new :command:`vim` session.

.. _renameutils: https://www.nongnu.org/renameutils/
