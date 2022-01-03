``localcfg/plugins/regex.vim``
==============================

.. include:: ../../.includes/scriptversion.rst

Only complete on installed languages::

    if has('cmdline_compl')
        command! -nargs=?
        \   -complete=customlist,plugins#regex#lang_complete
        \   Regex call regex#regex#OpenTestWindow(<q-args>)
    endif

.. seealso::

    * :func:`lang_complete <lang_complete>`
