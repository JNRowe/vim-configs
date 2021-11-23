``vimrc.d/packages.vim``
========================

Enable ``:Cfilter`` for using enormously noisy compilers::

    packadd! cfilter

When using server mode ``editexisting`` makes using currently open files far
simpler::

    packadd editexisting

Useful justification options::

    command! -range -nargs=* Justify packadd justify |
    \   <line1>,<line2>Justify <args>

Enable the *experimental* gdb_ support::

    if has('terminal')
        command! -bang -complete=file -nargs=* Termdebug delcommand Termdebug |
        \   packadd termdebug |
        \   Termdebug<bang> <args>
    endif

.. note::

    ``termdebug`` tests for ``:Termdebug`` to prohibit re-sourcing the package
    instead of a regular ``g:loaded_`` variable, so we need to delete before
    loading.

.. _gdb: http://www.gnu.org/s/gdb/
