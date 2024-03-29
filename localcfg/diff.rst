``localcfg/diff.vim``
=====================

.. include:: ../.includes/scriptversion.rst

Ignore whitespace by default::

    set diffopt+=iwhite

Use histogram :command:`diff` method to match my |git| configuration::

    set diffopt+=algorithm:histogram,indent-heuristic

The remaining functionality is only useful when ``:autocmd`` is available.

::

    if !has('autocmd')
        finish
    endif

.. note::

    While this may seem like an odd thing to test here, some builds of |vim| are
    incredibly bare.  This is often the case for console-only builds, which are
    sometimes the default for tools such as :command:`git difftool`.

.. _diff-custom-maps:

Add my bindings for :command:`diff` mode::

    augroup jnrowe_diff
        autocmd!
        autocmd BufRead * if &diff | call filetypes#diff_maps() | endif
    augroup END

.. seealso::

    * :func:`filetypes#diff_maps() <diff_maps>`
