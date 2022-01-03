``localcfg/plugins/vim_snippets.vim``
=====================================

.. include:: ../../.includes/scriptversion.rst

Configure personal settings for snippets::

    let g:snips_author = g:user_email
    let g:snips_github =
    \   'https://github.com/' .. substitute(g:user_email, '.* <\(.*\)@.*',
    \                                       '\1', '')
