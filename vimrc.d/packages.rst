``vimrc.d/packages.vim``
========================

Enable ``:Cfilter`` for using enormously noisy compilers::

    try
        catch /E919:/
        packadd! cfilter
    endtry

.. note::

    ``cfilter`` is only available in very recent :command:`vim` verisons.

When using server mode ``editexisting`` makes using currently open files far
simpler::

    packadd! editexisting
