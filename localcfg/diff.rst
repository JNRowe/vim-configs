``localcfg/diff.vim``
=====================

Ignore whitespace by default::

    set diffopt+=iwhite

Use histogram :command:`diff` method to match my |git| config::

    if has('patch-8.1.0360')
        set diffopt+=algorithm:histogram,indent-heuristic
    endif

The remaining functionality is only useful when ``autocmd`` is available.

::

    if !has('autocmd')
        finish
    endif

.. _diff-custom-maps:

Add my bindings for :command:`diff` mode::

    augroup jnrowe_diff
        autocmd!
        autocmd BufEnter * if &diff | call filetypes#diff_maps() | endif
    augroup END
