``ftdetect/qmv.vim``
====================

Change to shell’s current directory when editing renameutils_ buffers to make
completion work correctly in the face of ``'autochdir'``::

    " vint: -ProhibitAutocmdWithNoGroup
    autocmd BufRead $TMP/qmv* cd $PWD | set noautochdir
    " vint: +ProhibitAutocmdWithNoGroup

.. warning::

    This *really* screws with shared sessions, but it shouldn’t matter as
    :command:`qmv` opens a new :command:`vim` session unless forced to do
    otherwise.

.. _renameutils: https://www.nongnu.org/renameutils/
