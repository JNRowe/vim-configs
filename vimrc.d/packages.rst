``vimrc.d/packages.vim``
========================

.. include:: ../.includes/vim9script.rst

.. note::

    The strange concoctions in this file are to support lazy loading of bundled
    packages.  If you know of a better way to perform this than I’d love to
    know, please file an |issue| or drop me a |mail|.

Enable ``:Cfilter`` for using enormously noisy compilers::

    for t in ['C', 'L']
        execute printf('command! -bang -nargs=+ %sfilter packadd cfilter | ' ..
                       '%sfilter<bang> <args>',
                       t, t)
    endfor

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
