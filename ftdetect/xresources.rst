``ftdetect/xresources.vim``
===========================

I store :command:`xrdb` configuration data in various files in
:file:``~/.Xresources.d/``, it would be nice if :command:`vim` could highlight
them::

    " vint: -ProhibitAutocmdWithNoGroup
    autocmd BufRead,BufNewFile ~/.Xresources.d/* setfiletype xdefaults
    " vint: +ProhibitAutocmdWithNoGroup

.. warning::

    This doesn’t use ``FALLBACK`` as we *always* want to override
    :command:`vim`’s default detection in this case.  The `use of
    a `preprocessor to modify resources` and relatively small files can often
    result in :command:`vim` mis-detecting the filetype in *interesting* ways.

.. _preprocessor to modify resources:
   https://jnrowe.github.io/articles/tips/Sharing_Xresources_between_systems.html

.. spelling::

    mis
