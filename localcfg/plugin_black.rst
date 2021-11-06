``localcfg/plugin_black``
=========================

Install :command:`black` in `XDG basedir`_ compliant location::

    let g:black_virtualenv = g:vim_cache_dir . '/black'

Uncompromising is good, but 88-character lines are not::

    let g:black_linelength = 79

All the Python projects I contribute to are the *exact* opposite of
:command:`black`’s quote formatting::

    let g:black_string_normalization = v:false

.. _XDG basedir:
    http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
