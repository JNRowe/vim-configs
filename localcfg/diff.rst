``localcfg/diff.vim``
=====================

Ignore whitespace by default::

    set diffopt+=iwhite

Use histogram :command:`diff` method to match my |git| configuration::

    if has('patch-8.1.0360')
        set diffopt+=algorithm:histogram,indent-heuristic
    endif

The remaining functionality is only useful when ``:autocmd`` is available.

::

    if !has('autocmd')
        finish
    endif

.. note::

    While this may seem like an odd thing to test here, some builds of
    :command:`vim` are incredibly bare.  This is often the case for console-only
    builds, which are sometimes the default for tools such as :command:`git
    difftool`.

.. _diff-custom-maps:

Add :func:`my bindings <diff_maps>` for :command:`diff` mode::

    augroup jnrowe_diff
        autocmd!
        autocmd BufEnter * if &diff | call filetypes#diff_maps() | endif
    augroup END
